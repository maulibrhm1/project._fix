import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/modules/bottom_tab/bottom_tab_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/home/status/modules/catering/pages/catering.dart';
import 'package:flutter_hotel_booking_ui/modules/home/status/modules/kosan/pages/kosan.dart';
import 'package:flutter_hotel_booking_ui/modules/home/status/modules/topup/topup.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_booking/filter_screen/filters_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_booking/hotel_home_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_detailes/room_booking_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_detailes/search_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/login/pages/auth.dart';
import 'package:flutter_hotel_booking_ui/routes/routes.dart';

class NavigationServices {
  NavigationServices(this.context);

  final BuildContext context;

  Future<dynamic> _pushMaterialPageRoute(Widget widget,
      {bool fullscreenDialog: false}) async {
    return await Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) => widget, fullscreenDialog: fullscreenDialog),
    );
  }

  void gotoSplashScreen() {
    Navigator.pushNamedAndRemoveUntil(
        context, RoutesName.splash, (Route<dynamic> route) => false);
  }

  void gotoIntroductionScreen() {
    Navigator.pushNamedAndRemoveUntil(context, RoutesName.introductionscreen,
        (Route<dynamic> route) => false);
  }

  void gobacktoLoginScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));
  }

  Future<dynamic> gotoLoginScreen() async {
    return await _pushMaterialPageRoute(LoginScreen());
  }

  Future<dynamic> gotoTabScreen() async {
    return await _pushMaterialPageRoute(BottomTabScreen(
      registered: false,
    ));
  }

  Future<dynamic> gotoSignupScreen() async {
    return await _pushMaterialPageRoute(SignUpScreen());
  }

  Future<dynamic> gotoForgotPassword() async {
    return await _pushMaterialPageRoute(ForgotPasswordScreen());
  }

  Future<dynamic> gotoSearchScreen() async {
    return await _pushMaterialPageRoute(SearchScreen());
  }

  Future<dynamic> gotoHotelHomeScreen() async {
    return await _pushMaterialPageRoute(HotelHomeScreen());
  }

  Future<dynamic> gotoHotelKosanPage() async {
    return await _pushMaterialPageRoute(KosanPage());
  }

  Future<dynamic> gotoCateringHomeScreen() async {
    return await _pushMaterialPageRoute(CateringHomeScreen());
  }

  Future<dynamic> gotoCateringMenu() async {
    return await _pushMaterialPageRoute(CateringMenu());
  }

  Future<dynamic> gotoTopupPage() async {
    return await _pushMaterialPageRoute(TopupPage());
  }

  Future<dynamic> gotoFiltersScreen() async {
    return await _pushMaterialPageRoute(FiltersScreen());
  }

  Future<dynamic> gotoRoomBookingScreen(String hotelname) async {
    return await _pushMaterialPageRoute(
        RoomBookingScreen(hotelName: hotelname));
  }
}
