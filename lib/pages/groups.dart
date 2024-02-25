import 'package:clash_meta_flutter/apis/apis.dart';
import 'package:clash_meta_flutter/models/proxies.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<Proxies, Delays>(builder: (ctx, p, d, _) {
      if (d.first && p.proxyList.containsKey("GLOBAL")) {
        d.futureGenerate(p.proxyList["GLOBAL"]!.all!);
        d.first = false;
      }
      return ListView(
        children: p.proxyList.values
            .where((node) => node.all != null)
            .map((selector) => Container(
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(200, 40, 40, 40),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: ExpansionTile(
                      title: Text(selector.name),
                      subtitle: Text(
                          "${selector.now!} ${d.delays[selector.now!] ?? 0} ms"),
                      trailing: IconButton(
                          onPressed: () async {
                            d.updateDelays(Map<String, int>.from(
                                await getGroupDelay(selector.name)));
                          },
                          icon: const Icon(Icons.speed)),
                      children: selector.all!
                          .map((node) => InkWell(
                                onTap: () async {
                                  final res = await changeProxyForSelector(
                                      selector.name, node);
                                  if (res) {
                                    if (kDebugMode) {
                                      print("ok");
                                    }
                                    p.updateSelectorNowNode(
                                        selector.name, node);
                                  } else {
                                    if (kDebugMode) {
                                      print("fail");
                                    }
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: node ==
                                              p.proxyList[selector.name]?.now!
                                          ? const Color.fromARGB(
                                              80, 33, 33, 200)
                                          : const Color.fromARGB(
                                              150, 46, 26, 5),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(25))),
                                  margin: const EdgeInsets.all(5),
                                  child: ListTile(
                                    title: Text(node),
                                    subtitle: Text("${d.delays[node] ?? 0} ms"),
                                    trailing: IconButton(
                                        onPressed: () async {
                                          d.updateDelays(
                                              await getSingleNodeDelay(node));
                                        },
                                        icon: const Icon(Icons.speed)),
                                  ),
                                ),
                              ))
                          .toList()),
                ))
            .toList(),
      );
    });
  }
}
