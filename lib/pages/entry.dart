import 'package:clash_meta_flutter/models/traffic.dart';
import 'package:clash_meta_flutter/pages/connections.dart';
import 'package:clash_meta_flutter/pages/groups.dart';
import 'package:clash_meta_flutter/pages/home.dart';
import 'package:clash_meta_flutter/pages/logs.dart';
import 'package:clash_meta_flutter/widgets/side_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Entry extends StatefulWidget {
  const Entry({super.key});

  @override
  State<StatefulWidget> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  int _idx = 0;
  late final List<Widget> _pages;
  @override
  void initState() {
    _pages = [
      const HomePage(),
      const GroupsPage(),
      const LogsPage(),
      const ConnectionsPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(136, 220, 217, 217)),
          child: Row(
            children: [
              SizedBox(
                width: 150,
                child: SideNavBar(
                  actions: [
                    {"概览": () => setState(() => _idx = 0)},
                    {"代理组": () => setState(() => _idx = 1)},
                    {"日志": () => setState(() => _idx = 2)},
                    {"连接": () => setState(() => _idx = 3)},
                  ],
                  activeItem: "概览",
                  extraItem: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Consumer<Traffic>(
                        builder: (_, t, __) {
                          return Text("Up:   ${t.up}");
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Consumer<Traffic>(
                        builder: (_, t, __) {
                          return Text("Down: ${t.down}");
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 255, 255, 255),
                            offset: Offset(1, 1))
                      ],
                      border: Border.all(
                          color: const Color.fromARGB(10, 255, 255, 255)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: _pages[_idx],
                ),
              )
            ],
          )),
    );
  }
}
