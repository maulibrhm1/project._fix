// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, duplicate_ignore

part of 'status.dart';

class StatusPage extends StatefulWidget {
  final authC = Get.find<AuthController>();

  StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  late MenuListData menuCatering;
  late AnimationController animationController;

  bool isRegistered = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final color = Theme.of(context).colorScheme.primary;
    const user = UserPreferences.myUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Status'),
        centerTitle: true,
        backgroundColor: Colors.tealAccent[700],
        // ignore: prefer_const_literals_to_create_immutables
      ),
      body: Background(
        child: ListView(physics: BouncingScrollPhysics(), children: [
          Column(
            children: [
              _profileWidget(user, context, color),
              _statusBody(size, context)
            ],
          ),
        ]),
      ),
    );
  }

  _statusBody(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'Randy',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(
            "Prayogo",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
          ),
          _statusMenu(
            icon: Icons.person_pin_rounded,
            text1: 'Bagian',
            text2: 'UI/UX Designer',
            press: () {},
          ),
          _statusMenu(
            text1: 'Durasi',
            text2: '3 Bulan',
            icon: Icons.hourglass_bottom_rounded,
            press: () {},
          ),
          _statusMenu(
            text1: 'Waktu yang tersisa',
            text2: '2 Bulan 7 Hari',
            icon: Icons.timer_outlined,
            press: () {},
          ),
          _statusMenu(
            text1: 'Catering',
            text2: 'Menu makanan',
            icon: Icons.restaurant_menu_rounded,
            press: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => CateringHomeScreen()));
            },
          ),
          _statusMenu(
            text1: 'Kosan',
            text2: 'Menu Kosan',
            icon: Icons.house,
            press: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => KosanPage()));
            },
          ),
          _statusMenu(
            text1: 'Laundry',
            text2: 'Nyuci tidak perlu cape',
            icon: Icons.add_business_rounded,
            press: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => LaundryMain()));
            },
          ),
          _statusMenu(
            text1: 'Galon',
            text2: 'Gak ada waktu buat beli galon?\nsini kami bantu',
            icon: Icons.water,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Container();
              }));
            },
          ),
          _statusMenu(
            text1: 'Gas',
            text2: 'Gak ada waktu buat beli gas?\nsini kami bantu',
            icon: Icons.assured_workload,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Container();
              }));
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: TextButton(
              onPressed: () => widget.authC.signout(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.output_rounded,
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Keluar')
                  ],
                ),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 40, 175, 112)),
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(70, 40, 175, 112)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
              ),
            ),
          )
        ],
      ),
    );
  }

  _statusMenu(
      {String? text1, String? text2, IconData? icon, Function()? press}) {
    return InkWell(
      onTap: press,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color.fromARGB(80, 40, 175, 112),
            ),
            child: Icon(
              icon,
              color: Color.fromARGB(255, 40, 175, 112),
              size: 30,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                text1!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  text2!,
                  textAlign: TextAlign.start,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _profileWidget(User user, BuildContext context, Color color) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {},
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                color: Colors.black,
                height: 120,
                width: 1,
              )),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  Text(
                    "Bergabung\n1 Januari 2021",
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('Saldoku'), Text('Rp. 500.000')]),
                  )
                ]),
              ),
              Positioned(
                  bottom: 10,
                  right: 0,
                  child: InkWell(
                      child: GestureDetector(
                    onTap: () => Get.to(() => TopupPage()),
                    child: buildAddIcon(color),
                  )))
            ],
          ),
        ],
      ),
    );
  }

  buildAddIcon(Color color) => buildCircle(
        color: Colors.tealAccent.shade700,
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      );

  buildCircle({required Widget child, required Color color}) => ClipOval(
        child: Container(
          padding: EdgeInsets.all(0),
          color: color,
          child: child,
        ),
      );
}
