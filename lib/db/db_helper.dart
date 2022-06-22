// import 'package:flutter_hotel_booking_ui/models/activity.dart';
// import 'package:sqflite/sqflite.dart';

// class DBHelper {
//   static Database? _db;
//   static final int _version = 1;
//   static final String _tableName = "Activity";

//   static Future<void> initDb() async {
//     if (_db != null) {
//       return;
//     }
//     try {
//       String _path = await getDatabasesPath() + 'activity.db';
//       _db =
//           await openDatabase(_path, version: _version, onCreate: (db, version) {
//         print("Create new data");
//         return db.execute("CREATE TABLE $_tableName("
//             "id INTEGER PRIMARY KEY AUTOINCREMENT, "
//             "kegiatan STRING, date STRING, "
//             "startTime STRING, endTime STRING, "
//             "color INTEGER, "
//             "isCompleted INTEGER");
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   static Future<int> insert(Activity? activity) async {
//     print("insert function called");
//     return await _db?.insert(_tableName, activity!.toJson()) ?? 1;
//   }

//   static Future<List<Map<String, dynamic>>> query() async {
//     print("query function called");
//     return await _db!.query(_tableName);
//   }
// }
