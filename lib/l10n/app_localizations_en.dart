// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Home Page';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error:';

  @override
  String get genericError => 'Error';

  @override
  String get loadingUsers => 'Loading Users...';
}
