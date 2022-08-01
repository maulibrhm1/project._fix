import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/modules/bottom_tab/bottom_tab_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/home/status/pages/status.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/background.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_text_field_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/remove_focuse.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../../../../../language/appLocalizations.dart';
import '../../../../../../services/firestore_services.dart';
import '../../../../../../utils/user.dart';
import '../../../components/status_components.dart';
import '../../topup/topup.dart';
import '../common/pendaftaran_common.dart';

part 'pendaftaran_main.dart';
part 'pendaftaran_form.dart';
part 'unregistered.dart';
