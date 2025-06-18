// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get hey_there => 'مرحبا بك!';

  @override
  String get welcom_back => 'مرحبًا بعودتك!';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get register => 'تسجيل حساب';

  @override
  String get create_account => 'إنشاء حساب';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get forgot_password => 'نسيت كلمة المرور؟';
}
