import 'package:flutter/material.dart';
import 'package:flutter_tdd_clean_architecture/feature/history/presentation/pages/history_page.dart';

import 'core/injector/injection_container.dart';

void main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TDD Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HistoryPage(),
    );
  }
}
