// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Startseite';

  @override
  String get loading => 'Lädt...';

  @override
  String get error => 'Fehler:';

  @override
  String get genericError => 'Error';

  @override
  String get loadingUsers => 'Loading Users...';
}
