import 'package:flutter/material.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar(
      {super.key,
      required this.actions,
      required this.extraItem,
      required this.activeItem});
  final Widget extraItem;
  final String activeItem;
  final List<Map<String, void Function()>> actions;
  @override
  State<StatefulWidget> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  String _activeItem = "";
  List<Widget> actions = [];
  @override
  void initState() {
    _activeItem = widget.activeItem;
    // for (int i = 0; i < actions.length - 1; i++) {
    //   actions.insert(i, const SizedBox(height: 15));
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    actions = widget.actions
        .map((m) => InkWell(
              onTap: () {
                m[m.keys.first]!();
                setState(() => _activeItem = m.keys.first);
              },
              child: Text(
                m.keys.first,
                style: TextStyle(
                  fontSize: 18,
                  color: m.keys.first == _activeItem
                      ? Colors.blueGrey
                      : Colors.grey,
                ),
              ),
            ))
        .toList();
    return Column(
      children: [
        widget.extraItem,
        const Spacer(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: actions,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
