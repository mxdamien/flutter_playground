import 'package:flutter/material.dart';

import '../../../../core/controllers/theme_controller.dart';
import '../../../../core/utils/theme_utils.dart';

class ThemeModeToggleButton extends StatelessWidget {
  const ThemeModeToggleButton({super.key, required this.themeController});

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconForThemeMode(themeController.themeMode)),
      onPressed: themeController.cycleThemeMode,
    );
  }
}
