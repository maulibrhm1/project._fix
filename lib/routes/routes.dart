import 'package:flutter/cupertino.dart';
import 'package:flutter_hotel_booking_ui/main_page.dart';
import 'package:flutter_hotel_booking_ui/modules/bottom_tab/bottom_tab_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/login/pages/auth.dart';
import 'package:flutter_hotel_booking_ui/modules/splash/splash.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RoutesName {
  static final pages = [
    GetPage(name: "/", page: () => MainPage()),
    GetPage(name: "/splash", page: () => SplashScreen()),
    GetPage(name: "/intro", page: () => const IntroductionScreen()),
    GetPage(name: "/login", page: () => const LoginScreen()),
    GetPage(name: "/signup", page: () => const SignUpScreen()),
    GetPage(
        name: "/home", page: () => const BottomTabScreen(registered: false)),
    GetPage(name: "/verifyemail", page: () => const VerifyEmailPage())
  ];
  static const String main = "/";
  static const String splash = "/splash";
  static const String introductionscreen = '/introductionScreen';
  static const String Login = '/login';
  static const String Home = '/home';
  static const String TabScreen = "/bottomTab/bottomTabScreen";
}
