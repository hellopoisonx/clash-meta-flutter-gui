import 'package:clash_meta_flutter/apis/apis.dart';
import 'package:clash_meta_flutter/models/proxies.dart';
import 'package:clash_meta_flutter/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        FutureProvider(
          initialData: Proxies(),
          create: (ctx) async {
            final a = await getProxies();
            return Proxies.fromJson(a);
          },
        ),
        ChangeNotifierProvider(
          create: (ctx) => Delays(),
        )
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
          primaryColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.grey)),
    );
  }
}
