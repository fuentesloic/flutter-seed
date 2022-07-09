import 'dart:async';
import 'dart:isolate';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'firebase_options.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await FirebaseCrashlytics.instance.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last,
      );
    }).sendPort);

    if (!kIsWeb) {
      if (kDebugMode) {
        // Force disable Crashlytics collection while doing every day development.
        // Temporarily toggle this to true if you want to test crash reporting in your app.
        await FirebaseCrashlytics.instance
            .setCrashlyticsCollectionEnabled(false);
      } else {
        // Handle Crashlytics enabled status when not in Debug,
        // e.g. allow your users to opt-in to crash reporting.
        await FirebaseCrashlytics.instance
            .setCrashlyticsCollectionEnabled(true);
      }
    }

    initializeDateFormatting().then((_) => runApp(const MyApp()));
  }, (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
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
            TextButton(
              onPressed: () {
                const version = '0.0.0';
                const userId = '1a2b3c5d5e';

                FirebaseCrashlytics.instance.setCustomKey('version', version);
                FirebaseCrashlytics.instance.setUserIdentifier(userId);

                FirebaseCrashlytics.instance.log('version faillure: $version');

                throw Exception('Crashlytics is bind with tags');
              },
              child: const Text('Test crashlytics'),
            ),
          ],
        ),
      ),
    );
  }
}
