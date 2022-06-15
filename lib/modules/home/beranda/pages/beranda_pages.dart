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
  int currentIndex = 0;
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
                          getCurrentTime();
                          _changeLabel();
                          changeColor();
                        },
                        child: Container(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 20,
                              ),
                              Text("Position : $locationMessage")
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              IconBeranda(icon: Icons.person),
                              Text(
                                WaktuMasuk,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text("Masuk")
                            ],
                          ),
                          Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              IconBeranda(
                                  icon: Icons.local_restaurant_outlined),
                              Text(
                                WaktuIstirahat,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text('Istirahat')
                            ],
                          ),
                          Column(
                            children: [
                              IconBeranda(icon: Icons.logout_sharp),
                              Text(
                                WaktuIzinKeluar,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text('Izin Keluar')
                            ],
                          ),
                          Column(
                            children: [
                              IconBeranda(icon: Icons.home),
                              Text(
                                WaktuPulang + 'Pulang',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      )
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

  getCurrentLocation() async {
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

  changeColor() {
    setState(() {
      if (i == 0 || i == 6) {
        colorIndex = 1;
        i++;
        print(colorIndex);
      } else if (i > 0 && i < 2) {
        colorIndex = 1;
        i++;
        print(colorIndex);
      } else if (i < 4) {
        colorIndex = 2;
        i++;
        print(colorIndex);
      } else {
        colorIndex = 0;
        i = 0;
        print(colorIndex);
      }
    });
  }

  _changeLabel() {
    setState(() {
      if (labelIndex < 6) {
        labelIndex++;
      } else {
        labelIndex = 0;
      }
    });
  }

  getCurrentTime() async {
    setState(() {
      if (currentIndex == 0) {
        WaktuMasuk = DateFormat.Hm().format(DateTime.now());
        currentIndex++;
      } else if (currentIndex == 1) {
        WaktuIstirahat = DateFormat.Hm().format(DateTime.now());
        currentIndex++;
      } else if (currentIndex == 2) {
        WaktuIstirahat = DateFormat.Hm().format(DateTime.now());
        currentIndex++;
      } else if (currentIndex == 3) {
        WaktuIzinKeluar = DateFormat.Hm().format(DateTime.now());
        currentIndex++;
      } else {
        WaktuPulang = DateFormat.Hm().format(DateTime.now());
        currentIndex = 0;
      }
    });
  }
}
