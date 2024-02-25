import 'dart:convert';

import 'package:clash_meta_flutter/apis/apis.dart';
import 'package:clash_meta_flutter/exceptions/exceptions.dart';
import 'package:clash_meta_flutter/models/logs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogsPage extends StatelessWidget {
  const LogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Logs>(builder: (_, logs, __) {
      return StreamBuilder(
        stream: createLogStream(),
        builder: (ctx, snap) {
          if (snap.hasError) {
            final err = snap.error as ApiExceptions;
            return Center(
              child: Text(
                err.errMsg(),
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if ((snap.connectionState == ConnectionState.active &&
                  snap.hasData) ||
              logs.logList.isNotEmpty) {
            if (snap.hasData) {
              logs.updateLogList(json.decode(snap.data!));
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
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    });
  }
}
