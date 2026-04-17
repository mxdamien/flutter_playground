// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'الصفحة الرئيسية';

  @override
  String get loading => 'جارٍ التحميل...';

  @override
  String get error => 'خطأ:';

  @override
  String get genericError => 'خطأ';

  @override
  String get loadingUsers => 'جارٍ تحميل المستخدمين...';
}
