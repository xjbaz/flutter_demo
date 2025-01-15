import 'package:flutter/material.dart';
import 'package:flutter_demo_app/view/input.dart';
import 'package:flutter_demo_app/view/output.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_demo_app/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('test'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.edit), text: '入力'),
              Tab(icon: Icon(Icons.visibility), text: '出力'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InputPage(),
            OutputPage(),
          ],
        ),
      ),
    );
  }
}
