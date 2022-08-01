import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hotel_booking_ui/common/common.dart';
import 'package:flutter_hotel_booking_ui/controller/auth_controller.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/main_page.dart';
import 'package:flutter_hotel_booking_ui/modules/bottom_tab/bottom_tab_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/splash/splash.dart';
import 'package:flutter_hotel_booking_ui/providers/theme_provider.dart';
import 'package:flutter_hotel_booking_ui/utils/enum.dart';
import 'package:flutter_hotel_booking_ui/routes/routes.dart';
import 'package:flutter_hotel_booking_ui/utils/snack_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

BuildContext? applicationcontext;

class MagangJogjaApp extends StatefulWidget {
  final authC = Get.put(AuthController(), permanent: true);

  MagangJogjaApp({Key? key}) : super(key: key);
  @override
  _MagangJogjaAppState createState() => _MagangJogjaAppState();
}

class _MagangJogjaAppState extends State<MagangJogjaApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, provider, child) {
        applicationcontext = context;
        final ThemeData _theme = provider.themeData;
        return GetMaterialApp(
          scaffoldMessengerKey: Utils.messengerKey,
          initialRoute: "/",
          getPages: RoutesName.pages,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('fr'), //French
            Locale('ja'), // Japanises
            Locale('ar'), //Arebic
          ],
          navigatorKey: navigatorKey,
          title: 'MagangJogja',
          debugShowCheckedModeBanner: false,
          theme: _theme,
          builder: (BuildContext context, Widget? child) {
            _setFirstTimeSomeData(context, _theme);
            return Directionality(
              textDirection:
                  context.read<ThemeProvider>().languageType == LanguageType.ar
                      ? TextDirection.rtl
                      : TextDirection.ltr,
              child: Builder(
                builder: (BuildContext context) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaleFactor: MediaQuery.of(context).size.width > 360
                          ? 1.0
                          : MediaQuery.of(context).size.width >= 340
                              ? 0.9
                              : 0.8,
                    ),
                    child: child ?? SizedBox(),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

// when this application open every time on that time we check and update some theme data
  void _setFirstTimeSomeData(BuildContext context, ThemeData theme) {
    applicationcontext = context;
    _setStatusBarNavigationBarTheme(theme);
    //we call some theme basic data set in app like color, font, theme mode, language
    context
        .read<ThemeProvider>()
        .checkAndSetThemeMode(MediaQuery.of(context).platformBrightness);
    context.read<ThemeProvider>().checkAndSetColorType();
    context.read<ThemeProvider>().checkAndSetFonType();
    context.read<ThemeProvider>().checkAndSetLanguage();
  }

  void _setStatusBarNavigationBarTheme(ThemeData themeData) {
    final brightness = !kIsWeb && Platform.isAndroid
        ? themeData.brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light
        : themeData.brightness;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: brightness,
      statusBarBrightness: brightness,
      systemNavigationBarColor: themeData.scaffoldBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: brightness,
    ));
  }

  Map<String, WidgetBuilder> _buildRoutes() {
    return {
      RoutesName.main: (context) => MainPage(),
      RoutesName.splash: (BuildContext context) => SplashScreen(),
      RoutesName.introductionscreen: (BuildContext context) =>
          IntroductionScreen(),
    };
  }
}
