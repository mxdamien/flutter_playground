import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_playground/core/di/injection.dart';

import 'core/constants/locales.dart';
import 'core/controllers/l10n_controller.dart';
import 'core/controllers/theme_controller.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'features/home/pages/home_page.dart';
import 'l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocaleController localeController = getIt<LocaleController>();
  final ThemeController themeController = getIt<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([localeController, themeController]),
      builder: (context, _) {
        return MaterialApp(
          locale: localeController.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: availableLocales,
          title: "MyApp",
          themeMode: themeController.themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: HomePage(),
        );
      },
    );
  }
}
