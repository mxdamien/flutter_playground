import 'package:flutter/material.dart';

import '../../../../core/controllers/l10n_controller.dart';

class LocaleToggleButton extends StatelessWidget {
  const LocaleToggleButton({super.key, required this.localeController});

  final LocaleController localeController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: localeController.cycleLocale,
      child: Text(
        localeController.locale.languageCode.toUpperCase(),
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
