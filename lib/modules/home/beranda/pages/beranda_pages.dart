// ignore_for_file: prefer_const_constructors

part of 'beranda.dart';

class BerandaPage extends StatefulWidget {
  final AttendanceModel? attendance;
  const BerandaPage({
    Key? key,
    this.attendance,
  }) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final docId = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final Stream<QuerySnapshot> _waktuStream = FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("attendance")
      .snapshots();
  TextEditingController catatanController = TextEditingController();

  List<TextEditingController> jamKerja = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  DocumentSnapshot? snapshot;
  String dateNote = "Today";
  int timeIndex = 0;
  int colorIndex = 0;
  int labelIndex = 0;
  int navbarIndex = 0;
  int i = 0;
  var locationMessage = "";
  var WaktuMasuk = "--:--";
  var WaktuIstirahat = "--:--";
  var WaktuIzinKeluar = "--:--";
  var WaktuPulang = "--:--";

//timer
  static const countdownDuration = Duration(minutes: 1);

  Duration duration = Duration();
  Duration duration2 = Duration();
  Timer? timer1;
  Timer? timer2;

  DateTime today = DateTime.now();
  bool isCountdown = false;
  bool showTime = false;

  void initState() {
    super.initState();
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer1?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void countDount() {
    const countdown = 1;
    final stop = duration2.inMinutes <= 0 ? 0 : 59;
    final seconds = duration2.inSeconds;
    final minutes = duration2.inMinutes;
    final hours = duration2.inHours;
    setState(() {
      if (seconds < 1) {
        duration2 = Duration(seconds: seconds + countdown);
      } else {
        duration2 = Duration(seconds: seconds - countdown);
      }
    });
  }

  void resetTimer() {
    if (isCountdown) {
      setState(() {
        duration = countdownDuration;
      });
    } else {
      duration = Duration();
    }
  }

  void startTimer1({bool resets = true}) {
    if (resets) {
      resetTimer();
    }
    timer1 = Timer.periodic(Duration(seconds: 1), (timer) => addTime());
  }

  void startTimer2({bool resets = true}) {
    if (resets) {
      resetTimer();
    }
    timer2 = Timer.periodic(Duration(seconds: 1), (timer) => countDount());
    duration2 = countdownDuration;
  }

  void stopTimer1({bool resets = true}) {
    if (resets) {
      resetTimer();
    }
    setState(() {
      timer1?.cancel();
    });
  }

  void stopTimer2({bool resets = true}) {
    if (resets) {
      resetTimer();
    }
    setState(() {
      timer2?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hour2 = twoDigits(duration2.inHours.remainder(24));
    final minutes2 = twoDigits(duration2.inMinutes.remainder(60));
    final seconds2 = twoDigits(duration2.inSeconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
        // ignore: prefer_const_literals_to_create_immutables
      ),
      body: Background(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  DigitalClock(
                    is24HourTimeFormat: true,
                    hourMinuteDigitTextStyle: TextStyles(context)
                        .getBoldStyle()
                        .copyWith(color: Colors.black, fontSize: 50),
                    digitAnimationStyle: Curves.elasticInOut,
                    showSecondsDigit: false,
                    areaDecoration: BoxDecoration(color: Colors.transparent),
                  ),
                  Text(
                    DateFormat.yMMMMEEEEd().format(DateTime.now()),
                    style: TextStyle(fontSize: 16),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _waktuStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("something went wrong");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading...");
                      }
                      final data = snapshot.requireData;
                      if (data.size < 1) {
                        return _bigButton();
                      }
                      if (data.size > 0) {
                        return _workTimerCountdown(
                            size, hour2, minutes2, seconds2);
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                  _location(),
                ],
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _waktuStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("something went wrong");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading...");
                  }
                  final data = snapshot.requireData;
                  if (data.size < 1) {
                    return Visibility(
                      visible: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _itemBeranda(WaktuMasuk + "\nMasuk", Icons.person),
                          _itemBeranda(WaktuIstirahat + "\nIstirahat",
                              Icons.local_restaurant_outlined),
                          _itemBeranda(WaktuIzinKeluar + "\nIzin Keluar",
                              Icons.logout_sharp),
                          _itemBeranda(WaktuPulang + '\nPulang', Icons.home)
                        ],
                      ),
                    );
                  }
                  if (data.size > 0) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.size,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _itemBeranda(
                                      "${snapshot.data!.docs[index]["masuk"]}\nMasuk",
                                      Icons.person),
                                  _itemBeranda(
                                      "${snapshot.data!.docs[index]["istirahat_kembali"]}\nIstirahat",
                                      Icons.local_restaurant_outlined),
                                  _itemBeranda(
                                      "${snapshot.data!.docs[index]["izin_kembali"]}\nIzin",
                                      Icons.logout_sharp),
                                  _itemBeranda(
                                      "${snapshot.data!.docs[index]["pulang"]}\nPulang",
                                      Icons.home)
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).padding.bottom,
                              )
                            ],
                          );
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> isDocumentExist() async {
    DocumentSnapshot<Map<String, dynamic>> document = await FirebaseFirestore
        .instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("attendance")
        .doc("attendance")
        .get();

    if (document.exists) {
      return true;
    } else {
      return false;
    }
  }

  _workTimerCountdown(
      Size size, String hour2, String minutes2, String seconds2) {
    return Column(
      children: [
        SizedBox(
          height: 14,
        ),
        Text(
          "Jumlah jam kerja hari ini",
          style: TextStyles(context).getRegularStyle().copyWith(fontSize: 16),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 20),
          height: 100,
          width: size.width * 0.6,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: duration2 > Duration(seconds: 0)
                  ? Text(
                      "-$hour2:$minutes2:$seconds2",
                      style: TextStyles(context)
                          .getRegularStyle()
                          .copyWith(fontSize: 48, color: Colors.red),
                    )
                  : Text(
                      "+$hour2:$minutes2:$seconds2",
                      style: TextStyles(context)
                          .getRegularStyle()
                          .copyWith(fontSize: 48, color: Colors.green),
                    )),
        ),
      ],
    );
  }

  Future<AttendanceModel?> readAttendance() async {
    final docAttendance =
        firestore.collection("user").doc(docId).collection("attendance").doc();
    final snapshot = await docAttendance.get();
    if (snapshot.exists) {
      return AttendanceModel.fromJson(snapshot.data()!);
    }
    return null;
  }

  _bigButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          if (timeIndex >= 0) {
            _getCurrentTime();
            _changeLabel();
            _changeColor();
          }
        },
        borderRadius: BorderRadius.circular(100),
        child: Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.all(8.0),
            // ignore: prefer_const_literals_to_create_immutables
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.touch_app,
                color: Colors.black,
                size: 100,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: changeLabel[labelIndex],
              )
            ]),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      bigButtonColor[colorIndex],
                    ]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(5, 15),
                  )
                ])),
      ),
    );
  }

  _outputTime() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _itemBeranda(WaktuMasuk + "\nMasuk", Icons.person),
            _itemBeranda(WaktuIstirahat + "\nIstirahat",
                Icons.local_restaurant_outlined),
            _itemBeranda(WaktuIzinKeluar + "\nIzin Keluar", Icons.logout_sharp),
            _itemBeranda(WaktuPulang + '\nPulang', Icons.home)
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom,
        )
      ],
    );
  }

  _itemBeranda(String text, IconData icon) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        IconBeranda(icon: icon),
        Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  _location() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on,
          size: 20,
        ),
        Text("Position : $locationMessage")
      ],
    );
  }

  _getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;
    setState(() {
      locationMessage = "Latitude: $lat, Longtitude: $long";
    });
  }

  _changeColor() {
    setState(() {
      if (i < 0) {
        colorIndex = 0;
        i++;
      } else if (i < 2) {
        colorIndex = 1;
        i++;
      } else if (i < 4) {
        colorIndex = 2;
        i++;
      } else if (i > 4) {
        colorIndex = 0;
        i++;
      } else {
        colorIndex = 0;
        i = -1;
      }
    });
  }

  _changeLabel() {
    setState(() {
      if (labelIndex < 5) {
        labelIndex++;
      } else {
        labelIndex = 0;
      }
    });
  }

  _getCurrentTime() async {
    CollectionReference attendance =
        firestore.collection("user").doc(docId).collection('attendance');
    final isRunning = false;

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hour1 = twoDigits(duration.inHours.remainder(24));
    final minutes1 = twoDigits(duration.inMinutes.remainder(60));
    final seconds1 = twoDigits(duration.inSeconds.remainder(60));
    final hour2 = twoDigits(duration.inHours.remainder(24));
    final minutes2 = twoDigits(duration.inMinutes.remainder(60));
    final seconds2 = twoDigits(duration.inSeconds.remainder(60));

    if (timeIndex == 0) {
      startTimer2(resets: false);
      jamKerja[0].text = DateFormat.Hm().format(DateTime.now());
      WaktuMasuk = DateFormat.Hm().format(DateTime.now());
      timeIndex++;
    } else if (timeIndex == 1) {
      jamKerja[1].text = DateFormat.Hm().format(DateTime.now());
      WaktuIstirahat = DateFormat.Hm().format(DateTime.now());
      timeIndex++;
    } else if (timeIndex == 2) {
      stopTimer1(resets: false);
      jamKerja[2].text = DateFormat.Hm().format(DateTime.now());
      jamKerja[6].text = "$hour1:$minutes1:$seconds1";
      WaktuIstirahat = DateFormat.Hm().format(DateTime.now());
      timeIndex++;
    } else if (timeIndex == 3) {
      startTimer1(resets: true);
      jamKerja[3].text = DateFormat.Hm().format(DateTime.now());
      WaktuIzinKeluar = DateFormat.Hm().format(DateTime.now());
      timeIndex++;
    } else if (timeIndex == 4) {
      stopTimer1(resets: false);
      jamKerja[4].text = DateFormat.Hm().format(DateTime.now());
      jamKerja[7].text = "$hour1:$minutes1:$seconds1";
      WaktuIzinKeluar = DateFormat.Hm().format(DateTime.now());
      timeIndex++;
    } else {
      showTime = true;
      stopTimer2();
      jamKerja[5].text = DateFormat.Hm().format(DateTime.now());
      jamKerja[8].text = "$hour2:$minutes2:$seconds2";
      await attendance.add({
        "date": DateFormat.yMd().format(DateTime.now()),
        "masuk": jamKerja[0].text,
        "istirahat_keluar": jamKerja[1].text,
        "istirahat_kembali": jamKerja[2].text,
        "izin_keluar": jamKerja[3].text,
        "izin_kembali": jamKerja[4].text,
        "pulang": jamKerja[5].text,
        "waktu_istirahat": "$hour1:$minutes1:$seconds1",
        "waktu_izin": "$hour1:$minutes1:$seconds1",
        "total": "$hour2:$minutes2:$seconds2"
      });
      WaktuPulang = DateFormat.Hm().format(DateTime.now());
      timeIndex = -1;
    }

    setState(() {});
  }
}
