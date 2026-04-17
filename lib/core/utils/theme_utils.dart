import 'package:flutter/material.dart';

IconData iconForThemeMode(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.system:
      return Icons.settings;
    case ThemeMode.light:
      return Icons.light_mode;
    case ThemeMode.dark:
      return Icons.dark_mode;
  }
}
