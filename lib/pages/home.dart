import 'package:clash_meta_flutter/models/traffic.dart';
import 'package:clash_meta_flutter/pages/connections.dart';
import 'package:clash_meta_flutter/pages/groups.dart';
import 'package:clash_meta_flutter/pages/logs.dart';
import 'package:clash_meta_flutter/widgets/side_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _idx = 0;
  late final List<Widget> _pages;
  @override
  void initState() {
    _pages = [
      const Home(),
      const GroupsPage(),
      const LogsPage(),
      const ConnectionsPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Container(
            color: Colors.black,
            width: 120,
            child: SideNavBar(
              actions: [
                {"Home": () => setState(() => _idx = 0)},
                {"Groups": () => setState(() => _idx = 1)},
                {"Logs": () => setState(() => _idx = 2)},
                {"Connections": () => setState(() => _idx = 3)},
              ],
              activeItem: "Home",
              extraItem: Column(
                children: [
                  Consumer<Traffic>(
                    builder: (_, t, __) {
                      return Text("Up:   ${t.up}");
                    },
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
            child: _pages[_idx],
          )
        ],
      )),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Text("HomePage");
  }
}
