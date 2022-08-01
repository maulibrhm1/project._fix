import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceModel {
  String id;
  String? masuk;
  String? istirahatKeluar;
  String? istirahatKembali;
  String? izinKeluar;
  String? izinKembali;
  String? pulang;
  String? waktuIstirahat;
  String? waktuIzin;
  String? waktuTotal;
  AttendanceModel({
    required this.id,
    this.masuk,
    this.istirahatKeluar,
    this.istirahatKembali,
    this.izinKeluar,
    this.izinKembali,
    this.pulang,
    this.waktuIstirahat,
    this.waktuIzin,
    this.waktuTotal,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "masuk": masuk,
        "istirahat_keluar": istirahatKeluar,
        "istirahat_kembali": istirahatKembali,
        "izin_keluar": izinKeluar,
        "izin_kembali": izinKembali,
        "waktu_istirahat": waktuIstirahat,
        "waktu_izin": waktuIzin,
        "waktu_total": waktuTotal,
      };

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      id: json["id"],
      masuk: json["masuk"],
      istirahatKeluar: json["istirahat_keluar"],
      istirahatKembali: json["istirahat_kembali"],
      izinKeluar: json["izin_keluar"],
      izinKembali: json["izin_kembali"],
      pulang: json["pulang"],
      waktuIstirahat: json["waktu_istirahat"],
      waktuIzin: json["waktu_izin"],
      waktuTotal: json["waktu_total"],
    );
  }
}
