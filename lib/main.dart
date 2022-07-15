import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_seed/crashlytics_utils.dart';
import 'package:flutter_seed/performance_utils.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'firebase_options.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await initCrashlyticsError();

      initializeDateFormatting().then(
        (_) => runApp(const MyApp()),
      );
    },
    (Object error, StackTrace stack) => bindCrashlyticsError(error, stack),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Seed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Seed - Home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Test crashlytics, raise issue pressing the button. Only for mobile",
            ),
            ElevatedButton(
              child: const Text('Throw error'),
              onPressed: () => reportCrashlyticsError(),
            ),
            const Text(
              "Test performance, try to navigate repititvly. Only for mobile",
            ),
            ElevatedButton(
              child: const Text('Navigate'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PerformanceRoute(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
