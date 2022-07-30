import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_seed/app.dart';
import 'package:flutter_seed/crashlytics_utils.dart';
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
        (_) => runApp(const SeederApp()),
      );
    },
    (Object error, StackTrace stack) => bindCrashlyticsError(error, stack),
  );
}
