import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    log(
      'Firebase Successfully Initialized',
      name: 'Firebase',
    );
  } catch (e, s) {
    log(
      'Firebase Initialization Failed',
      error: e,
      stackTrace: s,
      name: 'Firebase',
    );
  }
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool b = preferences.getBool('firstTime') ?? false;
  runApp(MyApp(settingsController: settingsController, firstTime: b));
}
