import 'package:clash_meta_flutter/models/clash_mem.dart';
import 'package:clash_meta_flutter/models/clash_rules.dart';
import 'package:clash_meta_flutter/models/connections.dart';
import 'package:clash_meta_flutter/models/ip_query.dart';
import 'package:clash_meta_flutter/models/logs.dart';
import 'package:clash_meta_flutter/models/proxies.dart';
import 'package:clash_meta_flutter/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GenericCard(
              title: "内存",
              titleIcon: const Icon(
                Icons.memory_rounded,
                color: Colors.green,
              ),
              content: Consumer<ClashMem>(
                builder: (_, mem, __) => Row(
                  children: [
                    Text(
                      mem.inuse.first,
                      style: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      mem.inuse.last,
                      style: const TextStyle(
                          fontSize: 15, fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              ),
            ),
            GenericCard(
              title: "节点",
              titleIcon: const Icon(
                Icons.route,
                color: Colors.blue,
              ),
              content: Consumer<Proxies>(
                builder: (_, p, __) => Row(
                  children: [
                    Text(
                      p.nodeAmount == 0 ? "-" : p.nodeAmount.toString(),
                      style: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      p.nodeAmount == 0 ? "" : "个",
                      style: const TextStyle(
                          fontSize: 15, fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              ),
            ),
            GenericCard(
              title: "规则",
              titleIcon: const Icon(
                Icons.compass_calibration,
                color: Colors.pink,
              ),
              content: Consumer<ClashRules>(
                builder: (_, r, __) => Row(
                  children: [
                    Text(
                      r.rulesAmount == 0 ? "-" : r.rulesAmount.toString(),
                      style: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      r.rulesAmount == 0 ? "" : "个",
                      style: const TextStyle(
                          fontSize: 15, fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              ),
            ),
            Consumer<IpQuery>(
                builder: (_, ip, __) => GenericCard(
                      title: "IP ${ip.ip}",
                      titleIcon: const Icon(
                        Icons.link,
                        color: Colors.orange,
                      ),
                      content: Text(
                        ip.address,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )),
            GenericCard(
                title: "活跃连接",
                titleIcon: const Icon(
                  Icons.network_cell,
                  color: Colors.red,
                ),
                content: Consumer<ConnectionController>(
                  builder: (_, conn, __) => Text(
                    conn.activeConnectionAmount == 0
                        ? "-"
                        : conn.activeConnectionAmount.toString(),
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
        const Divider(
          thickness: 0.5,
        ),
        GenericCard(
          height: 100 * 4,
          title: "事件",
          titleIcon: const Icon(
            Icons.file_copy_rounded,
            color: Colors.green,
          ),
          content: Column(
            children: [
              Consumer<Logs>(
                  builder: (ctx, l, __) => Column(children: () {
                        final s = <Widget>[];
                        s.add(const Divider());
                        for (var i = 0; i < 4; i++) {
                          if (i > l.logList.length - 1) {
                            return [
                              const Center(
                                child: CircularProgressIndicator(),
                              )
                            ];
                          }
                          final log = l.logList[i];
                          s.add(ListTile(
                            leading: Text(
                              log.first.type == "warning"
                                  ? "warn"
                                  : log.first.type == "debug"
                                      ? "dbug"
                                      : log.first.type,
                            ),
                            title: Text(log.first.payload),
                            subtitle: Text(log.last),
                          ));
                          s.add(const Divider());
                        }
                        return s;
                      }()))
            ],
          ),
        ),
        const Spacer()
      ],
    );
  }
}
