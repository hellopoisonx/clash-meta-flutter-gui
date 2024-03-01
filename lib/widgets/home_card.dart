import 'package:flutter/material.dart';

class GenericCard extends StatelessWidget {
  const GenericCard(
      {super.key,
      required this.title,
      required this.titleIcon,
      required this.content,
      this.height = 95});
  final String title;
  final double height;
  final Widget titleIcon;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(25),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          minWidth: 180,
        ),
        height: height,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                titleIcon,
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            content
          ],
        ),
      ),
    );
  }
}
