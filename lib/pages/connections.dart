import 'package:clash_meta_flutter/apis/apis.dart';
import 'package:clash_meta_flutter/models/connections.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConnectionsPage extends StatefulWidget {
  const ConnectionsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ConnectionsPageState();
}

class _ConnectionsPageState extends State<ConnectionsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectionController>(builder: (__, conn, _) {
      if (conn.conn == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Stack(
        alignment: Alignment.center,
        children: [
          ListView.builder(
            itemCount: conn.activeConnectionAmount,
            itemBuilder: (ctx, idx) {
              final connection = conn.conn?.connections[idx];
              return ExpansionTile(
                leading: ElevatedButton(
                  onPressed: () => killSingleConnection(connection?.id ?? ""),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(const CircleBorder())),
                  child: const Icon(Icons.close),
                ),
                title: Text(
                    "${connection?.metadata.network}|${connection?.metadata.type}"),
                subtitle: Text(connection?.chains.reversed.join("=>") ?? ""),
              );
            },
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () => killAllConnections(),
                child: const Icon(Icons.close),
              ))
        ],
      );
    });
  }
}
