import 'package:clash_meta_flutter/apis/apis.dart';
import 'package:clash_meta_flutter/models/proxies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<Proxies, Delays>(builder: (ctx, p, d, _) {
      return ListView(
        children: p.proxyList.values
            .where((node) => node.all != null)
            .map((selector) => ExpansionTile(
                  title: Text(selector.name),
                  subtitle: Text(
                      "${selector.now!} ${d.delays[selector.now!] ?? 0} ms"),
                  trailing: IconButton(
                      onPressed: () async {
                        d.updateDelays(Map<String, int>.from(
                            await getGroupDelay(selector.name)));
                      },
                      icon: const Icon(Icons.speed)),
                  children: () {
                    List<Widget> nodes = selector.all!
                        .map((node) => Container(
                              decoration: BoxDecoration(
                                  color: node == selector.now!
                                      ? Colors.blueGrey
                                      : Colors.grey,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16))),
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
                            ))
                        .toList();
                    for (var i = 0; i < nodes.length - 1; i++) {
                      nodes.insert(
                          i,
                          Container(
                            height: 10,
                          ));
                    }
                    return nodes;
                  }(),
                ))
            .toList(),
      );
    });
  }
}
