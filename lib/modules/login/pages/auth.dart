import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/common/common.dart';
import 'package:flutter_hotel_booking_ui/controller/auth_controller.dart';

import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/modules/bottom_tab/bottom_tab_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/home/status/modules/laundry/pages/laundry.dart';
import 'package:flutter_hotel_booking_ui/modules/login/components/login_components.dart';
import 'package:flutter_hotel_booking_ui/services/firestore_services.dart';
import 'package:flutter_hotel_booking_ui/utils/snack_bar.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/validator.dart';
import 'package:flutter_hotel_booking_ui/widgets/background.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_appbar_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_text_field_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/remove_focuse.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:get/get.dart';

import '../../home/status/modules/kosan/pages/kosan.dart';
import '../../home/status/modules/pednaftaran/pages/pendaftaran.dart';

part 'login_screen.dart';
part 'sign_up_Screen.dart';
part 'forgot_password.dart';
part 'verify_email.dart';

part 'email_verified.dart';
