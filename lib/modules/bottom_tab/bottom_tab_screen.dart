import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/modules/explore/explore.dart';
import 'package:flutter_hotel_booking_ui/modules/home/absensi/page/absensi.dart';
import 'package:flutter_hotel_booking_ui/modules/home/beranda/pages/beranda.dart';
import 'package:flutter_hotel_booking_ui/modules/home/notes/pages/notes.dart';
import 'package:flutter_hotel_booking_ui/modules/home/status/pages/status.dart';
import 'package:flutter_hotel_booking_ui/modules/myTrips/my_trips_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/profile/profile_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/providers/theme_provider.dart';
import 'package:flutter_hotel_booking_ui/modules/bottom_tab/components/tab_button_UI.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';
import 'package:provider/provider.dart';

class BottomTabScreen extends StatefulWidget {
  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isFirstTime = true;
  Widget _indexView = Container();
  BottomBarType bottomBarType = BottomBarType.Home;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    _indexView = Container();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _startLoadScreen());
    super.initState();
  }

  Future _startLoadScreen() async {
    await Future.delayed(const Duration(milliseconds: 480));
    setState(() {
      _isFirstTime = false;
      _indexView = const BerandaPage();
    });
    _animationController..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                return const CupertinoPageScaffold(child: StatusPage());
              });
            default:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(child: BerandaPage());
              });
          }
        });
  }

  // tabClick(BottomBarType tabType) {
  //   if (tabType != bottomBarType) {
  //     bottomBarType = tabType;
  //     _animationController.reverse().then((f) {
  //       if (tabType == BottomBarType.Home) {
  //         setState(() {
  //           _indexView = CupertinoTabView(builder: (context) {
  //             return CupertinoPageScaffold(child: BerandaPage());
  //           });
  //         });
  //       } else if (tabType == BottomBarType.Attendance) {
  //         setState(() {
  //           _indexView = MyTripsScreen(
  //             animationController: _animationController,
  //           );
  //         });
  //       } else if (tabType == BottomBarType.Notes) {
  //         setState(() {
  //           _indexView = ProfileScreen(
  //             animationController: _animationController,
  //           );
  //         });
  //       } else if (tabType == BottomBarType.Status) {
  //         setState(() {
  //           _indexView = ProfileScreen(
  //             animationController: _animationController,
  //           );
  //         });
  //       }
  //     });
  //   }
  // }

  // getBottomBarUI(BottomBarType tabType) {
  //   return CommonCard(
  //     color: AppTheme.mainColor,
  //     radius: 0,
  //     child: Column(
  //       children: <Widget>[
  //         Row(
  //           children: <Widget>[
  //             TabButtonUI(
  //               icon: Icons.home,
  //               isSelected: tabType == BottomBarType.Home,
  //               text: AppLocalizations(context).of("home"),
  //               onTap: () {
  //                 tabClick(BottomBarType.Home);
  //               },
  //             ),
  //             TabButtonUI(
  //               icon: Icons.notes_rounded,
  //               isSelected: tabType == BottomBarType.Attendance,
  //               text: AppLocalizations(context).of("attendance"),
  //               onTap: () {
  //                 tabClick(BottomBarType.Attendance);
  //               },
  //             ),
  //             TabButtonUI(
  //               icon: Icons.note_alt_outlined,
  //               isSelected: tabType == BottomBarType.Notes,
  //               text: AppLocalizations(context).of("notes"),
  //               onTap: () {
  //                 tabClick(BottomBarType.Notes);
  //               },
  //             ),
  //             TabButtonUI(
  //               icon: Icons.more_outlined,
  //               isSelected: tabType == BottomBarType.Status,
  //               text: AppLocalizations(context).of("status"),
  //               onTap: () {
  //                 tabClick(BottomBarType.Status);
  //               },
  //             ),
  //           ],
  //         ),
  //         SizedBox(
  //           height: MediaQuery.of(context).padding.bottom,
  //         )
  //       ],
  //     ),
  //   );
  // }
}

enum BottomBarType { Home, Attendance, Notes, Status }
