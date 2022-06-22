// ignore_for_file: prefer_const_constructors

part of 'beranda.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  TextEditingController catatanController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Container(child: Text('Catatan Kegiatan')),
        centerTitle: true,
        backgroundColor: Colors.tealAccent[700],
        // ignore: prefer_const_literals_to_create_immutables
      ),
      body: Background(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Text(
                        DateFormat.Hm().format(DateTime.now()),
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        DateFormat.yMMMMEEEEd().format(DateTime.now()),
                        style: TextStyle(fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          _getCurrentTime();
                          _changeLabel();
                          _changeColor();
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 14),
                            padding: EdgeInsets.all(40),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              Icon(
                                Icons.touch_app,
                                color: Colors.white,
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
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Colors.white,
                                      mainButtonColor[colorIndex],
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
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          _location(),
                          SizedBox(
                            height: 20,
                          ),
                          _output()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _output() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            IconBeranda(icon: Icons.person),
            Text(
              WaktuMasuk + "\nMasuk",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            IconBeranda(icon: Icons.local_restaurant_outlined),
            Text(
              WaktuIstirahat + "\nIstirahat",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            IconBeranda(icon: Icons.logout_sharp),
            Text(
              WaktuIzinKeluar + "\nIzin Keluar",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            IconBeranda(icon: Icons.home),
            Text(
              WaktuPulang + '\nPulang',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
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
    setState(() {
      if (timeIndex == 0) {
        WaktuMasuk = DateFormat.Hm().format(DateTime.now());
        timeIndex++;
      } else if (timeIndex == 1) {
        WaktuIstirahat = DateFormat.Hm().format(DateTime.now());
        timeIndex++;
      } else if (timeIndex == 2) {
        WaktuIstirahat = DateFormat.Hm().format(DateTime.now());
        timeIndex++;
      } else if (timeIndex == 3) {
        WaktuIzinKeluar = DateFormat.Hm().format(DateTime.now());
        timeIndex++;
      } else if (timeIndex == 4) {
        WaktuIzinKeluar = DateFormat.Hm().format(DateTime.now());
        timeIndex++;
      } else {
        WaktuPulang = DateFormat.Hm().format(DateTime.now());
        timeIndex = -1;
      }
    });
  }
}
