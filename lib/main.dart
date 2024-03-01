import 'package:clash_meta_flutter/apis/apis.dart';
import 'package:clash_meta_flutter/models/clash_mem.dart';
import 'package:clash_meta_flutter/models/clash_rules.dart';
import 'package:clash_meta_flutter/models/connections.dart';
import 'package:clash_meta_flutter/models/ip_query.dart';
import 'package:clash_meta_flutter/models/logs.dart';
import 'package:clash_meta_flutter/models/proxies.dart';
import 'package:clash_meta_flutter/models/traffic.dart';
import 'package:clash_meta_flutter/pages/entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) {
          final ip = IpQuery();
          ip.futureGenerate();
          return ip;
        }),
        ChangeNotifierProvider(create: (ctx) {
          final r = ClashRules();
          r.futureGenerate();
          return r;
        }),
        ChangeNotifierProvider(create: (ctx) {
          final conn = ConnectionController();
          createConnectionStream(conn);
          return conn;
        }),
        ChangeNotifierProvider(create: (ctx) {
          final l = Logs();
          createLogStream(l);
          return l;
        }),
        ChangeNotifierProvider(create: (ctx) {
          final mem = ClashMem();
          getMem(mem);
          return mem;
        }),
        ChangeNotifierProvider(
          create: (ctx) {
            final p = Proxies();
            p.futureGenerate();
            return p;
          },
        ),
        ChangeNotifierProvider(
          create: (ctx) => Delays(),
        ),
        ChangeNotifierProvider(create: (ctx) {
          final t = Traffic();
          getTraffic(t);
          return t;
        })
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final routes = <String, Widget Function(BuildContext)>{
      "/": (context) => const Entry()
    };
    return MaterialApp(
      title: "clash-meta-flutter-ui",
      routes: routes,
      initialRoute: "/",
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColorDark: Colors.grey,
          iconTheme: const IconThemeData(color: Colors.black)),
    );
  }
}
