import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hotel_booking_ui/firebase_options.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/providers/theme_provider.dart';
import 'package:flutter_hotel_booking_ui/magang_jogja_app.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(_setAllProviders()));
}

_setAllProviders() {
  return
      // GetMaterialApp(
      //   navigatorKey: navigatorKey,
      //   title: "MagangJogja App",
      //   home: MainPage(),
      // );

      MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(
          state: AppTheme.getThemeData,
        ),
      ),
    ],
    child: MagangJogjaApp(),
  );
}
