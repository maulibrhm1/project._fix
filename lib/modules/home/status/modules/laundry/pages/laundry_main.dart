// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

part of 'laundry.dart';

class LaundryMain extends StatefulWidget {
  const LaundryMain({Key? key}) : super(key: key);

  @override
  State<LaundryMain> createState() => _LaundryMainState();
}

class _LaundryMainState extends State<LaundryMain> {
  String leftText = '';
  String rightText = '';
  bool visible = false;
  ScrollController scrollController = new ScrollController();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text("Laundry"),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 14),
              child: historyButton(
                  onClicked: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => LaundryHistory()))))
        ],
      ),
      body: Background(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 52),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(DateFormat.yMMMEd().format(DateTime.now()),
                  style: TextStyle(fontSize: 20)),
              _bigButton(),
              Text(
                'Alamat Pengantaran:',
                style:
                    TextStyles(context).getTitleStyle().copyWith(fontSize: 16),
              ),
              SizedBox(
                width: size.width * 0.7,
                child: Text(
                    "Jembatan Janti, Gg. Arjuna No.59, Jaranan, Karangjambe, Banguntapan, Bantul Regency, Special Region of Yogyakarta 55198",
                    textAlign: TextAlign.center),
              ),
              Text('Lokasi Kamar:',
                  style: TextStyles(context)
                      .getTitleStyle()
                      .copyWith(fontSize: 16)),
              Text('Kamar no.10 Lantai 2'),
              CommonButton(
                  buttonText: 'Status',
                  textColor: Colors.black,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => LaundryStatus()));
                  }),
            ],
          ),
        ),
      )),
    );
  }

  historyButton({required VoidCallback onClicked}) => InkWell(
        onTap: onClicked,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu_book,
              size: 30,
            ),
            Text(
              'History',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      );
  _bigButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {},
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
                child: Text(
                  "Laundry Yuk",
                  style: TextStyles(context)
                      .getRegularStyle()
                      .copyWith(fontSize: 18),
                ),
              )
            ]),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Colors.orange.shade500,
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
}
