import 'package:flutter/material.dart';
import 'package:movie_clean/core/services/services_locator.dart';
import 'package:movie_clean/test.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const TestScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
