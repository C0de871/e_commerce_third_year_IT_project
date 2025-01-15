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
/// import 'gen_l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// The language currently selected in the application
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// app Name
  ///
  /// In en, this message translates to:
  /// **'Grablt'**
  String get appName;

  /// Welcome message on the login screen
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// Instruction message for login options
  ///
  /// In en, this message translates to:
  /// **'Sign in with your email and password\nor Continue with social media'**
  String get signInMessage;

  /// Prompt for users without an account
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// welcome line
  ///
  /// In en, this message translates to:
  /// **'welcome to Grablt, let\'s shop!'**
  String get welcome;

  /// second word appear when we swap in splash screen
  ///
  /// In en, this message translates to:
  /// **'we help people conect wiyth store '**
  String get splash2word;

  /// third word appear when we swap in splash screen
  ///
  /// In en, this message translates to:
  /// **'we show the easy way to shop \njust stay at home wuth us '**
  String get splash3word;

  /// Button text for signing up a new user
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// Title for the registration screen
  ///
  /// In en, this message translates to:
  /// **'Register Account'**
  String get registerAccount;

  /// Instruction text for completing details or using social media login
  ///
  /// In en, this message translates to:
  /// **'Complete your details or continue \nwith social media'**
  String get completeYourdetails;

  /// Label for the email input field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Placeholder text for the email input field
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// Label for the password input field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Placeholder text for the password input field
  ///
  /// In en, this message translates to:
  /// **'Enter Your Password'**
  String get enterYourPassword;

  /// Label for the confirm password input field
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Placeholder text for the confirm password input field
  ///
  /// In en, this message translates to:
  /// **'Confirm Your Password'**
  String get reEnterYourPassword;

  /// Error message shown when a required field is left empty
  ///
  /// In en, this message translates to:
  /// **'This field cannot be empty'**
  String get thisFieldCannotBeEmpty;

  /// Error message shown when the email entered is not in a valid format
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get pleaseEnterValidEmail;

  /// Error message shown when the password field is left empty
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordIsRequired;

  /// Error message shown when the password is shorter than 8 characters
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordMustBeAtLeast8Characters;

  /// Error message shown when the password does not meet the complexity requirements
  ///
  /// In en, this message translates to:
  /// **'Password must include at least one of the following:\n- A capital and small letter\n- A number\n- A symbol'**
  String get passwordComplexityRequirement;

  /// Error message shown when the password and confirm password fields do not match
  ///
  /// In en, this message translates to:
  /// **'The two passwords must be identical.'**
  String get doesNotMatch;

  /// Text for the button that continues the signup process
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueSignUp;

  /// Message displayed to inform the user about terms of use and privacy policy agreement
  ///
  /// In en, this message translates to:
  /// **'By continuing, you confirm that you agree\nwith our Terms of Use and Privacy Policy'**
  String get byContinuingYouAgreeTo;

  /// Title for the screen to complete user profile
  ///
  /// In en, this message translates to:
  /// **'Complete Profile'**
  String get completeProfile;

  /// Instruction text for completing profile details or using social media login
  ///
  /// In en, this message translates to:
  /// **'Complete your details or continue\nwith social media'**
  String get completeYourProfileDetails;

  /// Label for the first name input field
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// Placeholder text for the first name input field
  ///
  /// In en, this message translates to:
  /// **'Enter your first name'**
  String get enterFirstName;

  /// Label for the last name input field
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// Placeholder text for the last name input field
  ///
  /// In en, this message translates to:
  /// **'Enter your last name'**
  String get enterLastName;

  /// Label for the address input field
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Placeholder text for the address input field
  ///
  /// In en, this message translates to:
  /// **'Enter your address'**
  String get enterAddress;

  /// Label for the phone number input field
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// Placeholder text for the phone number input field
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterPhoneNumber;

  /// Error message shown when the first name field is empty
  ///
  /// In en, this message translates to:
  /// **'First name is required'**
  String get firstNameRequired;

  /// Error message shown when the last name field is empty
  ///
  /// In en, this message translates to:
  /// **'Last name is required'**
  String get lastNameRequired;

  /// Error message shown when the address field is empty
  ///
  /// In en, this message translates to:
  /// **'Address is required'**
  String get addressRequired;

  /// Error message shown when the phone number field is empty
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get phoneNumberRequired;

  /// Error message shown when the phone number does not start with 09 or is not 10 digits long
  ///
  /// In en, this message translates to:
  /// **'Phone number must have 10 digits and start with 09'**
  String get phoneNumberInvalid;

  /// Title of the OTP verification screen
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get otpVerification;

  /// Message showing that a verification code was sent to the user's email.
  ///
  /// In en, this message translates to:
  /// **'We sent a verification code to {email}.'**
  String verificationCodeSent(Object email);

  /// Text for the continue button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// Text for the link to resend the OTP code
  ///
  /// In en, this message translates to:
  /// **'Resend OTP Code'**
  String get resendOtp;

  /// Label before the countdown timer showing when the user can resend the code
  ///
  /// In en, this message translates to:
  /// **'You can resend code in'**
  String get resendIn;

  /// word login to appBar
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Section title for special offers
  ///
  /// In en, this message translates to:
  /// **'Stores'**
  String get specialForYou;

  /// Section title for popular products
  ///
  /// In en, this message translates to:
  /// **'Popular Product'**
  String get popularProduct;

  /// Text for expanding additional content
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get seeMore;

  /// Text prefix for showing the origin or source
  ///
  /// In en, this message translates to:
  /// **'From: '**
  String get from;

  /// Placeholder text for the search input field
  ///
  /// In en, this message translates to:
  /// **'Search Product'**
  String get searchProduct;

  /// Subtitle text below the app name
  ///
  /// In en, this message translates to:
  /// **'Express Shopping'**
  String get expressShopping;

  /// Text for the button that continues the next splash page process
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueSplash;

  /// the login process is done by right way in  appbar
  ///
  /// In en, this message translates to:
  /// **'Login Success'**
  String get successScreen;

  /// the login process is done by right way
  ///
  /// In en, this message translates to:
  /// **'Login successfully'**
  String get successLogin;

  /// button in success login back you to home
  ///
  /// In en, this message translates to:
  /// **'Bach to home'**
  String get backToHome;

  /// label in app bar of cart screen
  ///
  /// In en, this message translates to:
  /// **'Your Cart'**
  String get yourCart;

  /// number of item in cart
  ///
  /// In en, this message translates to:
  /// **'4 items'**
  String get numberOfItem;

  /// title of button that confirm the deletion
  ///
  /// In en, this message translates to:
  /// **'Confirm deletion'**
  String get confirmDeletion;

  /// title of button that confirm the modifition
  ///
  /// In en, this message translates to:
  /// **'Confirm Modification'**
  String get confirmModification;

  /// title of button that go to check out screen
  ///
  /// In en, this message translates to:
  /// **'Check Out'**
  String get checkOut;

  /// Label for the button to view the store
  ///
  /// In en, this message translates to:
  /// **'View store'**
  String get viewStore;

  /// Label for the product price
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// My products appears in first line of check out screen
  ///
  /// In en, this message translates to:
  /// **'My Products:'**
  String get myProducts;

  /// Title for the settings screen.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Label for selecting the English language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Label for selecting the Arabic language.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// Label for selecting the system default language option.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefault;

  /// Fallback text shown when an error occurs.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
