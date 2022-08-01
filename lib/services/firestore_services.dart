import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final attendanceCollection =
    FirebaseFirestore.instance.collection("attendance");

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreService {
  final String? uid;
  FirestoreService({this.uid});
  CollectionReference activities = firestore
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('activity');
  CollectionReference biodata = firestore
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("form pendaftaran");
  CollectionReference attendance = firestore.collection('attendance');
  CollectionReference user = firestore.collection('user');

  Future updateUserData(
    String name,
    String uname,
    String email,
    String password,
  ) async {
    try {
      await user.doc(uid).set({
        "name": name,
        "user_name": uname,
        "email": email,
        "password": password,
      });
    } catch (e) {}
  }

  Future addActivity(
    String activity,
    int color,
    String date,
    String endTime,
    String startTime,
    int isCompleted,
  ) async {
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

  Future addAttendance(
    String masuk,
    String istirahatKeluar,
    String istirahatMasuk,
    String izinKeluar,
    String izinMasuk,
    String pulang,
  ) async {
    try {
      await attendance.add({
        "masuk": masuk,
        "istirahat_keluar": istirahatKeluar,
        "istirahat_masuk": istirahatMasuk,
        "izin_keluar": izinKeluar,
        "izin_masuk": izinMasuk,
        "pulang": pulang,
      });
    } catch (e) {}
  }

  Future updateAttendance(
    String docId, {
    String? masuk,
    String? istirahatKeluar,
    String? istirahatMasuk,
    String? izinKeluar,
    String? izinMasuk,
    String? pulang,
  }) async {
    try {
      await attendance.doc(docId).update({
        "masuk": masuk,
        "istirahat_keluar": istirahatKeluar,
        "istirahat_masuk": istirahatMasuk,
        "izin_keluar": izinKeluar,
        "izin_masuk": izinMasuk,
        "pulang": pulang,
      });
    } catch (e) {}
  }

  Future addUserBio(
    String bio1,
    String bio2,
    String bio3,
    String bio4,
    String bio5,
    String bio6,
    String bio7,
    String bio8,
    String bio9,
    String bio10,
    String bio11,
    String bio12,
    String bio13,
    String bio14,
    String bio15,
    String bio16,
    String bio17,
    String bio18,
    String bio19,
    String bio20,
    String bio21,
    String bio22,
    String bio23,
    String bio24,
    String bio25,
  ) async {
    try {
      await biodata.add({
        "Nama Lengkap": bio1,
        "NIK (Nomor Induk Kependudukan)": bio2,
        "Email": bio3,
        "Jenis Kelamin": bio4,
        "No. HP yang bisa dihubungi (termasuk WA)": bio5,
        "Asal Sekolah/Kampus": bio6,
        "Program Studi": bio7,
        "Nama Kota/Daerah tempat tinggal saat ini": bio8,
        "Mengapa Anda ingin Magang/PKL disini": bio9,
        "Jenis Magang apa yang Anda pilih": bio10,
        "Sistem Magang": bio11,
        "Status Anda saat ini": bio12,
        "Apakah Anda bisa membaca buku berbahasa inggris": bio13,
        "No. HP Aktif (termasuk WA) Dosen atau Guru Pembimbing"
            "PKL/Magang berserta Nama dan Jabatannya": bio14,
        "Program Magang/PKL apa yang Anda minati": bio15,
        "Jam kerja magang yang dipilih": bio16,
        "Software design yang dikuasai": bio17,
        "Software editing video yang dikuasai": bio18,
        "Basaha pemrograman yang dikuasai": bio19,
        "Materi yang mana yang ingin di praktikan oleh yang memilih Digita Marketing":
            bio20,
        "Memiliki alat kerja pribadi": bio21,
        "Jika YA, alat kerja apa?": bio22,
        "Rencana mulai magang": bio23,
        "Anda tahu info magang ini darimana?": bio24,
        "Apakah anda membawa motor?": bio25,
      });
    } catch (e) {}
  }
}
