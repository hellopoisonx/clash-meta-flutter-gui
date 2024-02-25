import 'package:clash_meta_flutter/apis/apis.dart';
import 'package:clash_meta_flutter/models/logs.dart';
import 'package:clash_meta_flutter/models/proxies.dart';
import 'package:clash_meta_flutter/models/traffic.dart';
import 'package:clash_meta_flutter/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
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
        ChangeNotifierProvider(create: (ctx) => Logs()),
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
      "/": (context) => const HomePage()
    };
    return MaterialApp(
      title: "clash-meta-flutter-ui",
      routes: routes,
      initialRoute: "/",
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColorDark: Colors.grey,
          iconTheme: const IconThemeData(color: Colors.grey)),
    );
  }
}
