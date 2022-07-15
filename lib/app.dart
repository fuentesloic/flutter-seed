import 'package:flutter/material.dart';
import 'package:flutter_seed/crashlytics_utils.dart';
import 'package:flutter_seed/performance_utils.dart';

class SeederApp extends StatelessWidget {
  const SeederApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Seed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Seed - Home page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
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
