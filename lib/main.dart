import 'package:flutter/material.dart';
import 'package:rick_and_morti/core/router/app_router.dart';
import 'package:rick_and_morti/di/inject_module.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
    );
  }
}
