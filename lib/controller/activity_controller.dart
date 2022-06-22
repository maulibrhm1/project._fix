// import 'package:flutter/cupertino.dart';
// import 'package:flutter_hotel_booking_ui/db/db_helper.dart';
// import 'package:flutter_hotel_booking_ui/models/activity.dart';
// import 'package:get/get.dart';

// class ActivityController extends GetxController {
//   @override
//   void onReady() {
//     super.onReady();
//   }

//   var activityList = <Activity>[].obs;

//   Future<int> addActivity({Activity? activity}) async {
//     return await DBHelper.insert(activity);
//   }

//   void getActivity() async {
//     List<Map<String, dynamic>> activity = await DBHelper.query();
//     activityList
//         .assignAll(activity.map((data) => Activity.fromJson(data)).toList());
//   }
// }
