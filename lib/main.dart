import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:playground/core/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/app/app.dart';

void _initCookie() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('sessionCookie', Env.cookie);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initCookie();

  // Set up global error handling
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) {
      // In release mode, log the error to a service or local storage
      // For example: MyErrorLoggingService.logError(details.exception, details.stack);
    } else {
      // In debug mode, print to console
      FlutterError.dumpErrorToConsole(details);
    }
  };
  runApp(const PGApp());
}
