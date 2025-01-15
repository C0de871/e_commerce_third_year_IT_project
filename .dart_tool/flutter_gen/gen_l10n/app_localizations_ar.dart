import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get language => 'العربية';

  @override
  String get appName => 'جرابلت';

  @override
  String get welcomeBack => 'مرحبًا بعودتك';

  @override
  String get signInMessage => 'قم بتسجيل الدخول باستخدام بريدك الإلكتروني وكلمة المرور أو تابع باستخدام وسائل التواصل الاجتماعي';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get welcome => 'مرحبا قي جرابلت . دعنا نتسوق';

  @override
  String get splash2word => 'نحن نساعد الناس العالم للتواصل مع المتاجر';

  @override
  String get splash3word => 'نقدم لكم طريقة سهلة للتسوق\nفقط ابقى في المنزل معنا';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get registerAccount => 'قم بإنشاء حساب جديد';

  @override
  String get completeYourdetails => 'اكمل تفاصيلك او استخدم وسائل التواصل الاجتماعي';

  @override
  String get email => 'البريد الالكتروني';

  @override
  String get enterYourEmail => 'ادخل بريدك الالكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get enterYourPassword => 'أدخل كلمة المرور';

  @override
  String get confirmPassword => 'تاكيد كلمة المرور';

  @override
  String get reEnterYourPassword => 'أعد كتابة كلمة المرور';

  @override
  String get thisFieldCannotBeEmpty => 'هذا الحقل لا يمكن أن يكون فارغًا';

  @override
  String get pleaseEnterValidEmail => 'يرجى إدخال عنوان بريد إلكتروني صالح';

  @override
  String get passwordIsRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordMustBeAtLeast8Characters => 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل';

  @override
  String get passwordComplexityRequirement => 'يجب أن تحتوي كلمة المرور على الأقل على واحد مما يلي:\n- حرف كبير وحرف صغير\n- رقم\n- رمز';

  @override
  String get doesNotMatch => 'كلمات المرور غير متطابقة';

  @override
  String get continueSignUp => 'متابعة';

  @override
  String get byContinuingYouAgreeTo => 'بالمتابعة انت تؤكد انك موافق على\nشروط استخدام التطبيق وسياسة الخصوصية';

  @override
  String get completeProfile => 'اكمل الملف الشخصي';

  @override
  String get completeYourProfileDetails => 'اكمل تفاصيل حسابك او استخدم وسائل\nالتواصل الاجتماعي';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get enterFirstName => 'ادخل اسمك الأول';

  @override
  String get lastName => 'اسم العائلة';

  @override
  String get enterLastName => 'ادخل اسم عائلتك';

  @override
  String get address => 'العنوان';

  @override
  String get enterAddress => 'ادخل عنوانك';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get enterPhoneNumber => 'ادخل رقم هاتفك';

  @override
  String get firstNameRequired => 'الاسم الأول مطلوب';

  @override
  String get lastNameRequired => 'اسم العائلة مطلوب';

  @override
  String get addressRequired => 'العنوان مطلوب';

  @override
  String get phoneNumberRequired => 'رقم الهاتف مطلوب';

  @override
  String get phoneNumberInvalid => 'يجب أن يحتوي رقم الهاتف على 10 أرقام ويبدأ بـ 09';

  @override
  String get otpVerification => 'التحقق باستخدام الرمز';

  @override
  String verificationCodeSent(Object email) {
    return 'لقد أرسلنا رمز التحقق إلى $email.';
  }

  @override
  String get continueText => 'متابعة';

  @override
  String get resendOtp => 'إعادة إرسال رمز التحقق';

  @override
  String get resendIn => 'يمكنك إعادة إرسال الرمز في';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get specialForYou => 'المتاجر';

  @override
  String get popularProduct => 'اشهر المنتجات';

  @override
  String get seeMore => 'عرض المزيد';

  @override
  String get from => 'من: ';

  @override
  String get searchProduct => 'ابحث عن المنتج';

  @override
  String get expressShopping => 'تسوق سريع';

  @override
  String get continueSplash => 'متابعة';

  @override
  String get successScreen => 'دخول ناجح';

  @override
  String get successLogin => 'تم الدخول بنجاح ';

  @override
  String get backToHome => 'العودة الى الرئيسية';

  @override
  String get yourCart => 'السلة الخاصة بك ';

  @override
  String get numberOfItem => '4 أغراض';

  @override
  String get confirmDeletion => 'تأكيد الحذف';

  @override
  String get confirmModification => 'تأكيد التعديل';

  @override
  String get checkOut => 'الذهاب للدفع';

  @override
  String get viewStore => 'عرض المتجر';

  @override
  String get price => 'السعر';

  @override
  String get myProducts => ': مشترياتي';

  @override
  String get settings => 'الإعدادات';

  @override
  String get english => 'الإنجليزية';

  @override
  String get arabic => 'العربية';

  @override
  String get systemDefault => 'افتراضي النظام';

  @override
  String get failed => 'فشل';
}
