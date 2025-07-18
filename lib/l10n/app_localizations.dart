import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @heyThere.
  ///
  /// In en, this message translates to:
  /// **'Hey there!'**
  String get heyThere;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcomeBack;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get createAccount;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @tellUsAboutYourSelf.
  ///
  /// In en, this message translates to:
  /// **'Tell us about yourself!'**
  String get tellUsAboutYourSelf;

  /// No description provided for @weNeedToKnowYourGender.
  ///
  /// In en, this message translates to:
  /// **'We Need To Know Your Gender'**
  String get weNeedToKnowYourGender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @howOldAreYou.
  ///
  /// In en, this message translates to:
  /// **'How old are you?'**
  String get howOldAreYou;

  /// No description provided for @thisHelpsUsCreateYourPersonalizedPlan.
  ///
  /// In en, this message translates to:
  /// **'This helps us create your personalized plan'**
  String get thisHelpsUsCreateYourPersonalizedPlan;

  /// No description provided for @whatIsYourWeight.
  ///
  /// In en, this message translates to:
  /// **'What is your weight?'**
  String get whatIsYourWeight;

  /// No description provided for @whatIsYourHeight.
  ///
  /// In en, this message translates to:
  /// **'What is your height?'**
  String get whatIsYourHeight;

  /// No description provided for @pleaseSelectYourGender.
  ///
  /// In en, this message translates to:
  /// **'Please select your gender'**
  String get pleaseSelectYourGender;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kg;

  /// No description provided for @cm.
  ///
  /// In en, this message translates to:
  /// **'CM'**
  String get cm;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgot_password;

  /// No description provided for @first_name.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get first_name;

  /// No description provided for @last_name.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get last_name;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already Have An Account?'**
  String get already_have_account;

  /// No description provided for @your_regular.
  ///
  /// In en, this message translates to:
  /// **'YOUR REGULAR PHYSICAL'**
  String get your_regular;

  /// No description provided for @activity_level.
  ///
  /// In en, this message translates to:
  /// **'ACTIVITY LEVEL?'**
  String get activity_level;

  /// No description provided for @rookie.
  ///
  /// In en, this message translates to:
  /// **'Rookie'**
  String get rookie;

  /// No description provided for @beginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get beginner;

  /// No description provided for @intermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get intermediate;

  /// No description provided for @advance.
  ///
  /// In en, this message translates to:
  /// **'Advance'**
  String get advance;

  /// No description provided for @true_beast.
  ///
  /// In en, this message translates to:
  /// **'True Beast'**
  String get true_beast;

  /// No description provided for @hey_there.
  ///
  /// In en, this message translates to:
  /// **'Hey there!'**
  String get hey_there;

  /// No description provided for @welcom_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcom_back;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPassword;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @smartChat.
  ///
  /// In en, this message translates to:
  /// **'Smart Chat'**
  String get smartChat;

  /// No description provided for @workOuts.
  ///
  /// In en, this message translates to:
  /// **'Workouts'**
  String get workOuts;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account yet ?'**
  String get dontHaveAccount;

  /// No description provided for @disciplineQuote.
  ///
  /// In en, this message translates to:
  /// **'the price of excellence \n is discipline'**
  String get disciplineQuote;

  /// No description provided for @onboardingText1.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa'**
  String get onboardingText1;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @funFitness.
  ///
  /// In en, this message translates to:
  /// **'Fitness has never been so \n much fun'**
  String get funFitness;

  /// No description provided for @onboardingText2.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa'**
  String get onboardingText2;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @noMoreExcuses.
  ///
  /// In en, this message translates to:
  /// **'NO MORE EXCUSES \n Do It Now'**
  String get noMoreExcuses;

  /// No description provided for @onboardingText3.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa'**
  String get onboardingText3;

  /// No description provided for @doIt.
  ///
  /// In en, this message translates to:
  /// **'Do It'**
  String get doIt;

  /// No description provided for @enter_your_email.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enter_your_email;

  /// No description provided for @forget_password_title.
  ///
  /// In en, this message translates to:
  /// **'Forget password'**
  String get forget_password_title;

  /// No description provided for @send_otp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get send_otp;

  /// No description provided for @otp_code.
  ///
  /// In en, this message translates to:
  /// **'OTP CODE'**
  String get otp_code;

  /// No description provided for @enter_your_otp_check_your_email.
  ///
  /// In en, this message translates to:
  /// **'Enter Your OTP Check Your Email'**
  String get enter_your_otp_check_your_email;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @didnt_receive_verficcation_code.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t Receive Verification Code?'**
  String get didnt_receive_verficcation_code;

  /// No description provided for @resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend Code?'**
  String get resend_code;

  /// No description provided for @resend_code_in.
  ///
  /// In en, this message translates to:
  /// **'resend code in'**
  String get resend_code_in;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'seconds'**
  String get seconds;

  /// No description provided for @password_characters.
  ///
  /// In en, this message translates to:
  /// **'make sure its 8 characters or more'**
  String get password_characters;

  /// No description provided for @create_new_password.
  ///
  /// In en, this message translates to:
  /// **'Create New Password'**
  String get create_new_password;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @email_sent_successfully.
  ///
  /// In en, this message translates to:
  /// **'Email Sent Successfully!'**
  String get email_sent_successfully;

  /// No description provided for @anErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred , Please try later'**
  String get anErrorOccurred;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// No description provided for @passwordChangedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully!'**
  String get passwordChangedSuccessfully;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'New password and confirmation do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @noResponse.
  ///
  /// In en, this message translates to:
  /// **' No Response'**
  String get noResponse;

  /// No description provided for @logout_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to close the Application ?'**
  String get logout_confirmation;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @yourWeight.
  ///
  /// In en, this message translates to:
  /// **'Your Weight'**
  String get yourWeight;

  /// No description provided for @yourHeight.
  ///
  /// In en, this message translates to:
  /// **'Your Height'**
  String get yourHeight;

  /// No description provided for @yourAge.
  ///
  /// In en, this message translates to:
  /// **'Your Age'**
  String get yourAge;

  /// No description provided for @yourGender.
  ///
  /// In en, this message translates to:
  /// **'Your Gender'**
  String get yourGender;

  /// No description provided for @yourGoal.
  ///
  /// In en, this message translates to:
  /// **'Your Goal'**
  String get yourGoal;

  /// No description provided for @yourActivityLevel.
  ///
  /// In en, this message translates to:
  /// **'Your Activity Level'**
  String get yourActivityLevel;

  /// No description provided for @tapToEdit.
  ///
  /// In en, this message translates to:
  /// **'tap To Edit'**
  String get tapToEdit;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @recommendationsToday.
  ///
  /// In en, this message translates to:
  /// **'Recommendations Today'**
  String get recommendationsToday;

  /// No description provided for @upcomingWorkouts.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Workouts'**
  String get upcomingWorkouts;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @recommendationsForYou.
  ///
  /// In en, this message translates to:
  /// **'Recommendations For You'**
  String get recommendationsForYou;

  /// No description provided for @popularTraining.
  ///
  /// In en, this message translates to:
  /// **'Popular Training'**
  String get popularTraining;
  String get getwhatsYourGoal;
  String get gainWeight;
  String get loseWeight;
  String get getFitter;
  String get gainMoreFlexibility;
  String get learnTheBasics;

  /// No description provided for @foodRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Food Recommendation'**
  String get foodRecommendation;

  /// No description provided for @recommendation.
  ///
  /// In en, this message translates to:
  /// **'Recommendation'**
  String get recommendation;

  /// No description provided for @hi.
  ///
  /// In en, this message translates to:
  /// **'Hi'**
  String get hi;

  /// No description provided for @letsStartYourDay.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Start Your Day'**
  String get letsStartYourDay;

  /// No description provided for @unableToGetUserName.
  ///
  /// In en, this message translates to:
  /// **'Unable to get user name'**
  String get unableToGetUserName;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'unknownError occurred please try later'**
  String get unknownError;
  String get security;
  String get privacyPolicy;
  String get help;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
