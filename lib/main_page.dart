import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/controller/auth_controller.dart';
import 'package:flutter_hotel_booking_ui/modules/bottom_tab/bottom_tab_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/login/pages/auth.dart';
import 'package:flutter_hotel_booking_ui/modules/splash/splash.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: authC.stramAuthStatus,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return const VerifyEmailPage();
            } else {
              return SplashScreen();
            }
          })),
    );
  }
}
