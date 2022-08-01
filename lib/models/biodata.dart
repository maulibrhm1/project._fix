import 'package:cloud_firestore/cloud_firestore.dart';

class BiodataModel {
  String? email;
  BiodataModel({
    this.email,
  });

  Map<String, dynamic> toJson() => {
        "id": email,
      };

  factory BiodataModel.fromJson(Map<String, dynamic> json) {
    return BiodataModel(
      email: json["email"],
    );
  }
}



// import 'package:cloud_firestore/cloud_firestore.dart';

// class BiodataModel {
//   String 
//   String 
//   String 
//   String 
//   String 

//   BiodataModel({
//   });

//   factory BiodataModel.fromJson(DocumentSnapshot snapshot) {
//     return BiodataModel(
//         id: snapshot.id,
//         activity: snapshot["activity"],
//         isCompleted: snapshot["isCompleted"],
//         date: snapshot["date"],
//         startTime: snapshot["startTime"],
//         endTime: snapshot["endTime"],
//         color: snapshot["color"]);
//   }

  
// }
