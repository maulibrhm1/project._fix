// ignore_for_file: prefer_const_constructors

part of 'topup_components.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  int detailIndex = 0;
  void initState() {
    super.initState();
    _navigatePayment();
  }

  _navigatePayment() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Stack(
              children: [
                Positioned(
                    left: 0,
                    top: 20,
                    child: Icon(
                      Icons.close,
                      size: 30,
                    )),
                SizedBox(
                  width: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'Pembayaran Berhasil',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Aplikasi akan terbuka otomatis\n untuk melakukan pembayaran',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Icon(
                                Icons.incomplete_circle_sharp,
                                size: 100,
                              ),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
