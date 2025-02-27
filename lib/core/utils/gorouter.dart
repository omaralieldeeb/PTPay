import 'package:go_router/go_router.dart';
import 'package:ptpay/feature/auth/presentation/view/ChooseLocationFirst.dart';
import 'package:ptpay/feature/auth/presentation/view/ChooseLocationSecond.dart';
import 'package:ptpay/feature/auth/presentation/view/ConfirmCreationNewPassword.dart';
import 'package:ptpay/feature/auth/presentation/view/Confirmaccountcreation.dart';
import 'package:ptpay/feature/auth/presentation/view/Driver_signup.dart';
import 'package:ptpay/feature/auth/presentation/view/LoginPageDriver.dart';
import 'package:ptpay/feature/auth/presentation/view/LoginPageRider.dart';
import 'package:ptpay/feature/auth/presentation/view/forgetpassword_page.dart';
import 'package:ptpay/feature/auth/presentation/view/otp.dart';
import 'package:ptpay/feature/auth/presentation/view/resetpassword.dart';
import 'package:ptpay/feature/auth/presentation/view/start_login_page.dart';
import 'package:ptpay/feature/home/presentation/view/MoneyTransfer.dart';
import 'package:ptpay/feature/home/presentation/view/homepage.dart';
import 'package:ptpay/feature/home/presentation/view/invoice.dart';
import 'package:ptpay/feature/splash/presentation/view/wellcome_page.dart';
import 'package:ptpay/feature/splash/presentation/view/widget/on_boarding.dart';
import 'package:ptpay/feature/splash/presentation/view/widget/start.dart';
import '../../feature/auth/presentation/view/Rider_signup.dart';

abstract class AppRouter {
  static const KStartScreen = "/StartScreen";
  static const KOnBoardingScreen = "/OnBoardingScreen";
  static const KStartLoginPage = "/StartLoginPage";
  static const KChooseLocationFirst = "/ChooseLocationFirst";
  static const KLoginPageRider = "/LoginPageRider";
  static const KLoginPageDriver = "/LoginPageDriver";
  static const KChooseLocationSecond = "/ChooseLocationSecond";
  static const KSignUpPageDriver = "/SignUpPageDriver";
  static const KSignUpPageRider = "/SignUpPageRider";
  static const KOTP = "/OTP";
  static const KConfirmAccountCreation = "/ConfirmAccountCreation";
  static const KForgetpassword = "/Forgetpassword";
  static const KResetPassword = "/ResetPassword";
  static const KConfirmCreationNewPassword = "/ConfirmCreationNewPassword";
  static const KHomepage = "/Homepage";
  static const KMoneyTransfer = "/MoneyTransfer";
  static const KInvoice = "/Invoice";

 static final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => WellcomePage()),
    GoRoute(path: KStartScreen, builder: (context, state) => StartScreen()),
    GoRoute(path: KOnBoardingScreen, builder: (context, state) => OnBoardingScreen()),
    GoRoute(path: KStartLoginPage, builder: (context, state) => StartLoginPage()),
    GoRoute(path: KChooseLocationFirst, builder: (context, state) => ChooseLocationFirst()),
    GoRoute(path: KLoginPageRider, builder: (context, state) => LoginPageRider()),
    GoRoute(path: KLoginPageDriver, builder: (context, state) => LoginPageDriver()),
    GoRoute(path: KChooseLocationSecond, builder: (context, state) => ChooseLocationSecond()),
    GoRoute(path: KSignUpPageDriver, builder: (context, state) => SignUpPageDriver()),
    GoRoute(path: KSignUpPageRider, builder: (context, state) => SignUpPageRider()),
    GoRoute(path: KOTP, builder: (context, state) => OTP()),
    GoRoute(path: KConfirmAccountCreation, builder: (context, state) => ConfirmAccountCreation()),
    GoRoute(path: KForgetpassword, builder: (context, state) => Forgetpassword()),
    GoRoute(path: KResetPassword, builder: (context, state) => ResetPassword()),
    GoRoute(path: KConfirmCreationNewPassword, builder: (context, state) => ConfirmCreationNewPassword()),
    GoRoute(path: KHomepage, builder: (context, state) => Homepage()),
    GoRoute(path: KMoneyTransfer, builder: (context, state) => MoneyTransfer()),
    GoRoute(path: KInvoice, builder: (context, state) => Invoice()),
  ]
);
}