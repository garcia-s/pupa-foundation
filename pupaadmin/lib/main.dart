import 'package:flutter/material.dart';
import 'package:pupaadmin/router/delegate.dart';
import 'package:pupaadmin/router/information_parser.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: InformationParser(),
      routerDelegate: AppRouterDelegate(),
      themeMode: ThemeMode.dark,
    );
  }
}
