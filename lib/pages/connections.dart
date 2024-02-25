import 'package:clash_meta_flutter/apis/apis.dart';
import 'package:clash_meta_flutter/models/connections.dart';
import 'package:flutter/material.dart';

class ConnectionsPage extends StatefulWidget {
  const ConnectionsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ConnectionsPageState();
}

class _ConnectionsPageState extends State<ConnectionsPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: createConnectionStream(),
      builder: (ctx, snap) {
        if (snap.hasError) {
          return Center(
            child: Text(
              snap.error.toString(),
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (snap.connectionState == ConnectionState.active &&
            snap.hasData) {
          if (snap.data!.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final c = Connections.fromJson(snap.data! as Map<String, dynamic>);
          return Stack(
            alignment: Alignment.center,
            children: [
              ListView.builder(
                itemCount: c.connections.length,
                itemBuilder: (ctx, idx) {
                  final connection = c.connections[idx];
                  return ExpansionTile(
                    leading: ElevatedButton(
                      onPressed: () => killSingleConnection(connection.id),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const CircleBorder())),
                      child: const Icon(Icons.close),
                    ),
                    title: Text(
                        "${connection.metadata.network}|${connection.metadata.type}"),
                    subtitle: Text(connection.chains.reversed.join("=>")),
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
