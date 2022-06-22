import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityModel {
  String id;
  String activity;
  int isCompleted;
  String date;
  String startTime;
  String endTime;
  int color;

  ActivityModel({
    required this.id,
    required this.activity,
    required this.isCompleted,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
  });

  factory ActivityModel.fromJson(DocumentSnapshot snapshot) {
    return ActivityModel(
        id: snapshot.id,
        activity: snapshot["activity"],
        isCompleted: snapshot["isCompleted"],
        date: snapshot["date"],
        startTime: snapshot["startTime"],
        endTime: snapshot["endTime"],
        color: snapshot["color"]);
  }

  // Activity.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   kegiatan = json['kegiatan'];
  //   isCompleted = json['isCompleted'];
  //   date = json['date'];
  //   startTime = json['startTime'];
  //   endTime = json['endTime'];
  //   color = json['color'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['kegiatan'] = this.kegiatan;
  //   data['isCompleted'] = this.isCompleted;
  //   data['data'] = this.date;
  //   data['startTime'] = this.startTime;
  //   data['endTime'] = this.endTime;
  //   data['color'] = this.color;
  //   return data;
  // }
}
