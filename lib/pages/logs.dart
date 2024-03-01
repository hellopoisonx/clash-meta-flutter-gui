import 'package:clash_meta_flutter/models/logs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogsPage extends StatelessWidget {
  const LogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Logs>(builder: (_, logs, __) {
      return Consumer<Logs>(
        builder: (_, l, __) {
          if (l.logList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: logs.logList
                .map(
                  (log) => ListTile(
                    leading: Text(
                      log.first.type == "warning"
                          ? "warn"
                          : log.first.type == "debug"
                              ? "dbug"
                              : log.first.type,
                    ),
                    title: Text(log.first.payload),
                    subtitle: Text(log.last),
                  ),
                )
                .toList(),
          );
        },
      );
    });
  }
}
