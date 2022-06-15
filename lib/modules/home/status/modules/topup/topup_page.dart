// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

part of 'topup.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({Key? key}) : super(key: key);

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
                    menuTopup(
                      text: 'Rp.50.000',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MetodePembayaran();
                        }));
                      },
                    ),
                    menuTopup(
                      text: 'Rp.100.000',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MetodePembayaran();
                        }));
                      },
                    ),
                  ]),
                  TableRow(children: [
                    menuTopup(
                      text: 'Rp.150.000',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MetodePembayaran();
                        }));
                      },
                    ),
                    menuTopup(
                      text: 'Rp.200.000',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MetodePembayaran();
                        }));
                      },
                    ),
                  ]),
                  TableRow(children: [
                    menuTopup(
                      text: 'Rp.250.000',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MetodePembayaran();
                        }));
                      },
                    ),
                    menuTopup(
                      text: 'Rp.300.000',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MetodePembayaran();
                        }));
                      },
                    ),
                  ]),
                  TableRow(children: [
                    menuTopup(
                      text: 'Rp.350.000',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MetodePembayaran();
                        }));
                      },
                    ),
                    menuTopup(
                      text: 'Rp.400.000',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MetodePembayaran();
                        }));
                      },
                    ),
                  ]),
                  TableRow(children: [
                    menuTopup(
                      text: 'Rp.450.000',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MetodePembayaran();
                        }));
                      },
                    ),
                    menuTopup(
                      text: 'Rp.500.000',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MetodePembayaran();
                        }));
                      },
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
}
