import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreService {
  CollectionReference activities = firestore.collection('activity');
  Future addActivity(String activity, int color, String date, String endTime,
      String startTime, int isCompleted) async {
    try {
      await activities.add({
        "activity": activity,
        "color": color,
        "date": date,
        "endTime": endTime,
        "startTime": startTime,
        "isCompleted": isCompleted,
      });
    } catch (e) {}
  }

  Future updateActivity(String docId, String activity, int color, String date,
      String endTime, String startTime, int isCompleted) async {
    try {
      await activities.doc(docId).update({
        "activity": activity,
        "color": color,
        "date": date,
        "endTime": endTime,
        "startTime": startTime,
        "isCompleted": isCompleted,
      });
    } catch (e) {}
  }
}
