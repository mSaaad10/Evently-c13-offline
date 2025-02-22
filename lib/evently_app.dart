import 'package:evently_c13_offline/config/theme/app_theme.dart';
import 'package:evently_c13_offline/core/routes_manager/routes.dart';
import 'package:evently_c13_offline/core/routes_manager/routes_manager.dart';
import 'package:evently_c13_offline/providers/lang_provider.dart';
import 'package:evently_c13_offline/providers/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Locale(langProvider.currentLang),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.getRoute,
      initialRoute: Routes.login,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: settingsProvider.currentTheme,
    );
  }
}
