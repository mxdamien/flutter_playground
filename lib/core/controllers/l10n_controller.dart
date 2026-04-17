import 'package:flutter/material.dart';

import '../constants/locales.dart';

class LocaleController extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }

  void cycleLocale() {
    final currentIndex = availableLocales.indexWhere(
      (l) => l.languageCode == _locale.languageCode,
    );

    final nextIndex = (currentIndex + 1) % availableLocales.length;

    setLocale(availableLocales[nextIndex]);
  }
}
