import 'package:evently_c13_offline/evently_app.dart';
import 'package:evently_c13_offline/firebase_options.dart';
import 'package:evently_c13_offline/providers/lang_provider.dart';
import 'package:evently_c13_offline/providers/setting_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
    ),
  ], child: const EventlyApp()));
}
