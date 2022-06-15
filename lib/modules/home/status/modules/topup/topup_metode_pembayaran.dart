part of 'topup.dart';

// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

class MetodePembayaran extends StatefulWidget {
  const MetodePembayaran({Key? key}) : super(key: key);

  @override
  State<MetodePembayaran> createState() => _MetodePembayaranState();
}

class _MetodePembayaranState extends State<MetodePembayaran> {
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
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 80, bottom: 20),
                  child: Text(
                    'SALDO',
                    style: TextStyle(fontSize: 40),
                  )),
              Saldo(text: 'Rp. 500.000', press: () {}),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'Top up Saldo',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Table(
                children: [
                  TableRow(children: [
                    menuPembayaran(
                      onTap: () {
                        loadingSheet(context);
                        if (panduanIndex > 0) {
                          panduanIndex = panduanIndex - panduanIndex;
                        } else {
                          panduanIndex = 0;
                        }
                      },
                      image: Image.asset('assets/images/ovo.png'),
                    ),
                    menuPembayaran(
                      onTap: () {
                        loadingSheet(context);
                        if (panduanIndex > 1) {
                          panduanIndex = panduanIndex - panduanIndex + 1;
                        } else if (panduanIndex < 1) {
                          panduanIndex++;
                        } else {
                          panduanIndex = 1;
                        }
                      },
                      image: Image.asset('assets/images/dana.png'),
                    ),
                  ]),
                  TableRow(children: [
                    menuPembayaran(
                      onTap: () {
                        loadingSheet(context);
                        if (panduanIndex > 2) {
                          panduanIndex = panduanIndex - panduanIndex + 2;
                        } else if (panduanIndex < 2) {
                          panduanIndex = panduanIndex + 2;
                        } else {
                          panduanIndex = 2;
                        }
                      },
                      image: Image.asset('assets/images/gopay.png'),
                    ),
                    menuPembayaran(
                      onTap: () {
                        loadingSheet(context);
                        if (panduanIndex > 3) {
                          panduanIndex = panduanIndex - panduanIndex + 3;
                        } else if (panduanIndex < 3) {
                          panduanIndex = panduanIndex + 3;
                        } else {
                          panduanIndex = 3;
                        }
                      },
                      image: Image.asset('assets/images/qris.png'),
                    ),
                  ]),
                  TableRow(children: [
                    menuPembayaran(
                      onTap: () {
                        loadingSheet(context);
                        if (panduanIndex > 4) {
                          panduanIndex == panduanIndex - panduanIndex + 4;
                        } else if (panduanIndex < 4) {
                          panduanIndex = panduanIndex + 4;
                        } else {
                          panduanIndex = 4;
                        }
                      },
                      image: Image.asset('assets/images/linkaja.png'),
                    ),
                    menuPembayaran(
                      onTap: () {
                        loadingSheet(context);
                        if (panduanIndex > 5) {
                          panduanIndex == panduanIndex - panduanIndex + 5;
                        } else if (panduanIndex < 5) {
                          panduanIndex = panduanIndex + 5;
                        } else {
                          panduanIndex = 5;
                        }
                      },
                      image: Image.asset('assets/images/mandiri.png'),
                    ),
                  ]),
                  TableRow(children: [
                    menuPembayaran(
                      onTap: () {
                        loadingSheet(context);
                        if (panduanIndex > 6) {
                          panduanIndex == panduanIndex - panduanIndex + 6;
                        } else if (panduanIndex < 6) {
                          panduanIndex = panduanIndex + 6;
                        } else {
                          panduanIndex = 6;
                        }
                      },
                      image: Image.asset('assets/images/bni.png'),
                    ),
                    menuPembayaran(
                      onTap: () {
                        loadingSheet(context);
                        if (panduanIndex > 7) {
                          panduanIndex == panduanIndex - panduanIndex + 7;
                        } else if (panduanIndex < 7) {
                          panduanIndex = panduanIndex + 7;
                        } else {
                          panduanIndex = 7;
                        }
                      },
                      image: Image.asset('assets/images/bri.png'),
                    ),
                  ]),
                  TableRow(children: [
                    menuPembayaran(
                      onTap: () {
                        loadingSheet(context);
                        if (panduanIndex > 8) {
                          panduanIndex == panduanIndex - panduanIndex + 8;
                        } else if (panduanIndex < 8) {
                          panduanIndex = panduanIndex + 8;
                        } else {
                          panduanIndex = 8;
                        }
                      },
                      image: Image.asset('assets/images/bca.png'),
                    ),
                    menuPembayaran(
                      onTap: () {
                        loadingSheet(context);
                        if (panduanIndex > 9) {
                          panduanIndex == panduanIndex - panduanIndex + 9;
                        } else if (panduanIndex < 9) {
                          panduanIndex = panduanIndex + 9;
                        } else {
                          panduanIndex = 9;
                        }
                      },
                      image: Image.asset('assets/images/cimbniaga.png'),
                    ),
                  ])
                ],
              ),
            ],
          )
        ],
      )),
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
              child: PaymentDetail(),
            )),
        context: context);
  }
}
