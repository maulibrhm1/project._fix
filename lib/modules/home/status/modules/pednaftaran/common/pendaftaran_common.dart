import 'package:flutter/cupertino.dart';

List<String> programMagang = [
  "R & D (Research and Development)",
  "Administrasi",
  "UI/UX",
  "Programmer (front end/backend)",
  "HR",
  "Photographer",
  "Videographer",
  "Social media specialist",
  "Content writer",
  "Marketing dan sales",
  "Desainer grafis",
  "Digital research",
  "Marcomm/public relation",
  "Host/presenter",
  "Tiktok creator",
  "Voice over talent",
  "Content planner",
  "Las",
  "Digital marketing"
];

List<int> group = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
];

List<TextEditingController?> biodataController = [
  TextEditingController(), //0
  TextEditingController(), //1
  TextEditingController(), //2
  TextEditingController(text: "Laki-laki"), //3
  TextEditingController(text: "Perempuan"), //4
  TextEditingController(), //5
  TextEditingController(), //6
  TextEditingController(), //7
  TextEditingController(), //8
  TextEditingController(text: "Magang Mandiri (bukan kewajiban kampus)"), //9
  TextEditingController(
      text: "Magang Kampus (kewajiban atau program kampus)"), //10
  TextEditingController(text: "WFO (Work From Office"), //11
  TextEditingController(text: "WFH Work From Home"), //12
  TextEditingController(text: "Masih sekolah/Masih Kuliah"), //13
  TextEditingController(
      text: "Sudah lulus Sekolah/Kuliah dan belum bekerja"), //14
  TextEditingController(text: "Sudah lulus dan sedang bekerja"), //15
  TextEditingController(text: "Saya bisa"), //16
  TextEditingController(text: "Saya kurang bisa\n(Bisa sedikit-sedikit)"), //17
  TextEditingController(text: "Saya tidak bisa"), //18
  TextEditingController(
      text: "09:00-17:00 (sudah termasuk 1 jam istirahat didalamnya)"), //19
  TextEditingController(
      text: "013:00-21:00 (sudah termasuk 1 jam istirahat didalamnya)"), //20
  TextEditingController(), //21
  TextEditingController(), //22
  TextEditingController(), //23
  TextEditingController(
      text:
          "Digital marketing organic. Nb : Free tanpa dana untuk beriklan"), //24
  TextEditingController(
      text:
          "Digital marketing Ads (FB Ads / Ig Ads). Nb : harus menyiapkan dana untuk belajar"
          "beriklan dengan Ads min. 30K/day selama iklan berjalan."), //25
  TextEditingController(), //26
  TextEditingController(text: "Ya ada"), //27
  TextEditingController(text: "Tidak ada"), //28
  TextEditingController(), //29
  TextEditingController(text: "Website"), //30
  TextEditingController(text: "Instagram"), //31
  TextEditingController(text: "Twitter"), //32
  TextEditingController(text: "Glints"), //33
  TextEditingController(text: "Youtube"), //34
  TextEditingController(), //35
  TextEditingController(text: "Iya"), //36
  TextEditingController(text: "Tidak"), //37
  TextEditingController(), //38
  TextEditingController(
      text:
          "Jika YA, alat apa yang Anda miliki, yang bisa Anda bawa selama Magang/PKL"), //39
  TextEditingController(
      text: "Laptop yang sudah terinstal corel dan photoshop"), //40
  TextEditingController(
      text:
          "laptop yang sudah terinstal adobe premier pro/final cut pro/adobe after effect"), //41
  TextEditingController(text: "Kamera DSLR"), //42
  TextEditingController(), //43
  TextEditingController(), //44
  TextEditingController(), //45
  TextEditingController(), //46
  TextEditingController(), //47
  TextEditingController(), //48
  TextEditingController(), //48
];

String biodataController1 = biodataController[0]!.text.trim();
String biodataController2 = biodataController[1]!.text.trim();
String biodataController3 = biodataController[2]!.text.trim();
String biodataController4 = biodataController[3]!.text.trim();
String biodataController5 = biodataController[4]!.text.trim();
String biodataController6 = biodataController[5]!.text.trim();
String biodataController7 = biodataController[6]!.text.trim();
String biodataController8 = biodataController[7]!.text.trim();
String biodataController9 = biodataController[8]!.text.trim();
String biodataController10 = biodataController[9]!.text.trim();
String biodataController11 = biodataController[10]!.text.trim();
String biodataController12 = biodataController[11]!.text.trim();
String biodataController13 = biodataController[12]!.text.trim();
String biodataController14 = biodataController[13]!.text.trim();
String biodataController15 = biodataController[14]!.text.trim();
String biodataController16 = biodataController[15]!.text.trim();
String biodataController17 = biodataController[16]!.text.trim();
String biodataController18 = biodataController[17]!.text.trim();
String biodataController19 = biodataController[18]!.text.trim();
String biodataController20 = biodataController[19]!.text.trim();
String biodataController21 = biodataController[20]!.text.trim();
String biodataController22 = biodataController[21]!.text.trim();
String biodataController23 = biodataController[22]!.text.trim();
String biodataController24 = biodataController[23]!.text.trim();
String biodataController25 = biodataController[24]!.text.trim();
String biodataController26 = biodataController[25]!.text.trim();
String biodataController27 = biodataController[26]!.text.trim();
String biodataController28 = biodataController[27]!.text.trim();
String biodataController29 = biodataController[28]!.text.trim();
String biodataController30 = biodataController[29]!.text.trim();
String biodataController31 = biodataController[30]!.text.trim();
String biodataController32 = biodataController[31]!.text.trim();
String biodataController33 = biodataController[32]!.text.trim();
String biodataController34 = biodataController[33]!.text.trim();
String biodataController35 = biodataController[34]!.text.trim();
String biodataController36 = biodataController[35]!.text.trim();
String biodataController37 = biodataController[36]!.text.trim();
String biodataController38 = biodataController[37]!.text.trim();
String biodataController39 = biodataController[38]!.text.trim();
String biodataController40 = biodataController[39]!.text.trim();
String biodataController41 = biodataController[40]!.text.trim();
String biodataController42 = biodataController[41]!.text.trim();
String biodataController43 = biodataController[42]!.text.trim();
String biodataController44 = biodataController[43]!.text.trim();
String biodataController45 = biodataController[44]!.text.trim();
String biodataController46 = biodataController[45]!.text.trim();
String biodataController47 = biodataController[46]!.text.trim();
String biodataController48 = biodataController[47]!.text.trim();
