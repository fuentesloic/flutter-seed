import 'dart:isolate';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

Future<void> initCrashlyticsError() async {
  if (!kIsWeb) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await FirebaseCrashlytics.instance.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last,
      );
    }).sendPort);
  } else {
    return debugPrint("Crashlytics is not activate on web and desktop app");
  }
}

void reportCrashlyticsError() {
  if (!kIsWeb) {
    FirebaseCrashlytics.instance.setCustomKey('level', 'dev');
    FirebaseCrashlytics.instance.setUserIdentifier('1a2b3c5d5e');

    throw Exception('Crashlytics is bind with tags');
  } else {
    return debugPrint("Crashlytics is not activate on web and desktop app");
  }
}

void bindCrashlyticsError(Object error, StackTrace stack) {
  if (!kIsWeb) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  }
}
