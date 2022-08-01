import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final formKey = GlobalKey<FormState>();

List<Map<String, String>>? allTexts; // we store all text in this variable
