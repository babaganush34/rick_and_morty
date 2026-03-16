import 'package:flutter/material.dart';
import 'package:rick_and_morti/di/inject_module.dart';
import 'package:rick_and_morti/features/rick/presentation/pages/rick_page.dart';

void main() async {
  configureDependencies();
  runApp(SafeArea(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RickPage(),
    ),
  ));
}
