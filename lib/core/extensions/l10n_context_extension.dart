import 'package:flutter/material.dart';
import 'package:flutter_playground/l10n/app_localizations.dart';

extension L10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
