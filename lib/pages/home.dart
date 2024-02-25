import 'package:clash_meta_flutter/pages/groups.dart';
import 'package:clash_meta_flutter/widgets/side_nav_bar.dart';
import 'package:flutter/material.dart';

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
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          SizedBox(
            width: 120,
            child: SideNavBar(actions: [
              {"Home": () => setState(() => _idx = 0)},
              {"Groups": () => setState(() => _idx = 1)}
            ], activeItem: "Home", extraItem: const Text("...")),
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
