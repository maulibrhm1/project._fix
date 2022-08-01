part of 'topup.dart';

// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

class MetodePembayaran extends StatefulWidget {
  const MetodePembayaran({Key? key}) : super(key: key);

  @override
  State<MetodePembayaran> createState() => _MetodePembayaranState();
}

class _MetodePembayaranState extends State<MetodePembayaran> {
  int index = 0;
  Timer? timer;
  bool i = true;

  void stopTimer() {
    setState(() {
      if (i == true) {
        Navigator.of(context).pop();
        timer?.cancel();
      } else {
        i == true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
          child: Column(
        children: [
          Row(
            children: const [
              Appbar(),
            ],
          ),
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 60, bottom: 20),
                  child: Text(
                    'SALDO',
                    style: TextStyle(fontSize: 40),
                  )),
              Saldo(text: 'Rp. 500.000', press: () {}),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'Top up Saldo',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.548,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [_buildTable()],
            ),
          )
        ],
      )),
    );
  }

  _buildTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade400, width: 1),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          _paymentOption(
            onTap: () {
              loadingSheet(context);
              if (index > 0) {
                index = index - index;
              } else {
                index = 0;
              }
              print(index);
            },
            image: Image.asset('assets/images/ovo.png'),
          ),
          _paymentOption(
            onTap: () {
              loadingSheet(context);
              if (index > 1) {
                index = index - index + 1;
              } else if (index < 1) {
                index++;
              } else {
                index = 1;
              }
              print(index);
            },
            image: Image.asset('assets/images/dana.png'),
          ),
        ]),
        TableRow(children: [
          _paymentOption(
            onTap: () {
              loadingSheet(context);
              if (index > 2) {
                index = index - index + 2;
              } else if (index < 2) {
                index = index + 2;
              } else {
                index = 2;
              }
            },
            image: Image.asset('assets/images/gopay.png'),
          ),
          _paymentOption(
            onTap: () {
              loadingSheet(context);
              if (index > 3) {
                index = index - index + 3;
              } else if (index < 3) {
                index = index + 3;
              } else {
                index = 3;
              }
            },
            image: Image.asset('assets/images/qris.png'),
          ),
        ]),
        TableRow(children: [
          _paymentOption(
            onTap: () {
              loadingSheet(context);
              if (index > 4) {
                index = index - index + 4;
              } else if (index < 4) {
                index = index + 4;
              } else {
                index = 4;
              }
            },
            image: Image.asset('assets/images/linkaja.png'),
          ),
          _paymentOption(
            onTap: () {
              loadingSheet(context);
              if (index > 5) {
                index == index - index + 5;
              } else if (index < 5) {
                index = index + 5;
              } else {
                index = 5;
              }
            },
            image: Image.asset('assets/images/mandiri.png'),
          ),
        ]),
        TableRow(children: [
          _paymentOption(
            onTap: () {
              loadingSheet(context);
              if (index > 6) {
                index == index - index + 6;
              } else if (index < 6) {
                index = index + 6;
              } else {
                index = 6;
              }
            },
            image: Image.asset('assets/images/bni.png'),
          ),
          _paymentOption(
            onTap: () {
              loadingSheet(context);
              if (index > 7) {
                index == index - index + 7;
              } else if (index < 7) {
                index = index + 7;
              } else {
                index = 7;
              }
            },
            image: Image.asset('assets/images/bri.png'),
          ),
        ]),
        TableRow(children: [
          _paymentOption(
            onTap: () {
              loadingSheet(context);
              if (index > 8) {
                index == index - index + 8;
              } else if (index < 8) {
                index = index + 8;
              } else {
                index = 8;
              }
            },
            image: Image.asset('assets/images/bca.png'),
          ),
          _paymentOption(
            onTap: () {
              loadingSheet(context);
              if (index > 9) {
                index == index - index + 9;
              } else if (index < 9) {
                index = index + 9;
              } else {
                index = 9;
              }
            },
            image: Image.asset('assets/images/cimbniaga.png'),
          ),
        ])
      ],
    );
  }

  Widget makeDismissible(BuildContext context,
          {required Widget child, bool stopTimer = true}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).pop();
          timer?.cancel();
        },
        child: GestureDetector(
          onTap: () {
            timer?.cancel();
          },
          child: child,
        ),
      );

  Future<dynamic> loadingSheet(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        builder: (context) => makeDismissible(context,
            child: ChangeNotifierProvider<TimerProvider>(
              create: (context) => TimerProvider(),
              child: PaymentDetail(index: index),
            )),
        context: context);
  }

  _paymentOption({Function()? onTap, Image? image}) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width * 0.5,
        height: size.height * 0.15,
        child: image,
        decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.grey.shade300)),
      ),
    );
  }
}
