import 'package:flutter/material.dart';
// import 'package:test_task_space_scutum/house_list_view.dart';
import 'package:test_task_space_scutum/pages/house_page.dart';
import 'package:test_task_space_scutum/pages/lift_page.dart';
// import 'package:test_task_space_scutum/hause.dart';
import 'package:test_task_space_scutum/pages/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const StartPage(),
        '/house': (context) => const HousePage(),
        '/lift': (context) => const LiftPage(
              floorValue: 0,
            ),
      },
      // home: StartPage(),
    );
  }
}
