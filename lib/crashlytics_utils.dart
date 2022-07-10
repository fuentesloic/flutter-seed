import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

void reportCrashlyticsError() {
  if (!kIsWeb) {
    FirebaseCrashlytics.instance.setCustomKey('level', 'dev');
    FirebaseCrashlytics.instance.setUserIdentifier('1a2b3c5d5e');

    throw Exception('Crashlytics is bind with tags');
  } else {
    return debugPrint("Crashlytics is not activate on web and desktop app");
  }
}
