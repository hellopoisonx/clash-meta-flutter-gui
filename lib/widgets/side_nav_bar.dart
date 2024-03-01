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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    actions = widget.actions
        .map((m) => InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              onTap: () {
                m[m.keys.first]!();
                setState(() => _activeItem = m.keys.first);
              },
              child: Container(
                alignment: Alignment.center,
                height: 35,
                width: 150,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: _activeItem == m.keys.first
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : const Color.fromARGB(87, 255, 255, 255),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Text(
                  m.keys.first,
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
            children: actions,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
