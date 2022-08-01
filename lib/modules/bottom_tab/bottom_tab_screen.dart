import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/controller/auth_controller.dart';
import 'package:flutter_hotel_booking_ui/modules/home/absensi/page/absensi.dart';
import 'package:flutter_hotel_booking_ui/modules/home/beranda/pages/beranda.dart';
import 'package:flutter_hotel_booking_ui/modules/home/notes/pages/notes.dart';
import 'package:flutter_hotel_booking_ui/modules/home/status/modules/pednaftaran/pages/pendaftaran.dart';
import 'package:flutter_hotel_booking_ui/modules/home/status/pages/status.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:get/get.dart';

import '../../models/biodata.dart';

class BottomTabScreen extends StatefulWidget {
  final bool registered;
  const BottomTabScreen({
    Key? key,
    required this.registered,
  }) : super(key: key);

  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  final Stream<QuerySnapshot> _pendaftaranStream = FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("form pendaftaran")
      .snapshots();

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    WidgetsBinding.instance!.addPostFrameCallback((_) => _startLoadScreen());
    super.initState();
  }

  Future _startLoadScreen() async {
    bool isRegistered = widget.registered;
    await Future.delayed(const Duration(milliseconds: 480));
    return isRegistered ? const BerandaPage() : const PendaftaranMain();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isRegistered = widget.registered;
    return StreamBuilder<QuerySnapshot>(
      stream: _pendaftaranStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading...");
        }
        final data = snapshot.requireData;
        if (data.size == 0) {
          return _unregisteredAccount();
        }
        if (data.size > 0) {
          return _registeredAccount();
        }
        return Center(child: CircularProgressIndicator());
      },
    );
    // return isRegistered ? _registeredAccount() : _unregisteredAccount();
  }

  Future<BiodataModel?> readAttendance() async {
    final firestore = FirebaseFirestore.instance;
    final docAttendance = firestore.collection("user").doc("");
    final snapshot = await docAttendance.get();
    if (snapshot.exists) {
      return BiodataModel.fromJson(snapshot.data()!);
    }
    return null;
  }

  _unregisteredAccount() {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            height: 60,
            backgroundColor: AppTheme.mainColor,
            activeColor: Colors.white,
            inactiveColor: Colors.black,
            iconSize: 30,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: AppLocalizations(context).of("home"),
              ),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.notes_rounded,
                  ),
                  label: AppLocalizations(context).of("attendance")),
              BottomNavigationBarItem(
                icon: const Icon(Icons.note_alt_outlined),
                label: AppLocalizations(context).of("notes"),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.more_outlined),
                label: AppLocalizations(context).of("status"),
              )
            ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                    child: UnregisteredPage(title: "Beranda"));
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                    child: UnregisteredPage(title: "Absensi"));
              });
            case 2:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                    child: UnregisteredPage(title: "Catatan Kegiatn"));
              });
            case 3:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(child: PendaftaranMain());
              });
            default:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(child: PendaftaranMain());
              });
          }
        });
  }

  _registeredAccount() {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            height: 60,
            backgroundColor: AppTheme.mainColor,
            activeColor: Colors.white,
            inactiveColor: Colors.black,
            iconSize: 30,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: AppLocalizations(context).of("home"),
              ),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.notes_rounded,
                  ),
                  label: AppLocalizations(context).of("attendance")),
              BottomNavigationBarItem(
                icon: const Icon(Icons.note_alt_outlined),
                label: AppLocalizations(context).of("notes"),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.more_outlined),
                label: AppLocalizations(context).of("status"),
              )
            ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(child: BerandaPage());
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(child: AbsensiMain());
              });
            case 2:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(child: NotesDateTable());
              });
            case 3:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: StatusPage());
              });
            default:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(child: BerandaPage());
              });
          }
        });
  }

  //
}
