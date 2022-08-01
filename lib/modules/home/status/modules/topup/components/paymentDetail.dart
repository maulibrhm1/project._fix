// ignore_for_file: prefer_const_constructors, duplicate_ignore

part of 'topup_components.dart';

class PaymentDetail extends StatefulWidget {
  final int? index;
  const PaymentDetail({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  List<String> data = [];
  static const countdownDuration = Duration(minutes: 5);

  var date = new DateTime.now();
  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void timeCountdown() {
    final countdown = 1;
    if (mounted) {
      setState(() {
        final seconds = duration.inSeconds;
        final minutes = duration.inMinutes;
        final hours = duration.inHours;
        final stop = duration.inMinutes <= 0 ? 0 : 59;
        if (seconds <= 0) {
          timer?.cancel();
          duration = Duration(minutes: minutes - seconds, seconds: stop);
        } else {
          duration = Duration(seconds: seconds - countdown);
        }
      });
    }
  }

  void startTimer() {
    setState(() {
      timer = Timer.periodic(Duration(seconds: 1), (_) => timeCountdown());
      duration = countdownDuration;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Pembayaran',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      Text(
                          'Segera selesaikan pembayaran anda sebelum\nwaktu habis'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(20),
                        child: Consumer<TimerProvider>(
                            builder: (context, timerprovider, widget) {
                          return Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Pembayaran akan berakhir dalam:',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: buildTime()),
                              Text(
                                '(sebelum senin, ${DateFormat.yMMMMd().format(DateTime(date.year, date.month, date.day + 1))}, 23.59)',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          );
                        }),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 50),
                    padding: EdgeInsets.all(10),
                    child: topupDescription[widget.index!]
                    // Column(children: [
                    //   if (panduanIndex == 0) ...[
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: ovo.map((e) => textList(e)).toList(),
                    //     )
                    //   ] else if (panduanIndex == 1) ...[
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: dana.map((e) => textList(e)).toList(),
                    //     )
                    //   ] else if (panduanIndex == 2) ...[
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: gopay.map((e) => textList(e)).toList(),
                    //     )
                    //   ] else if (panduanIndex == 3) ...[
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: gopay.map((e) => textList(e)).toList(),
                    //     )
                    //   ] else if (panduanIndex == 4) ...[
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: gopay.map((e) => textList(e)).toList(),
                    //     )
                    //   ] else if (panduanIndex == 5) ...[
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: gopay.map((e) => textList(e)).toList(),
                    //     )
                    //   ] else if (panduanIndex == 6) ...[
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: gopay.map((e) => textList(e)).toList(),
                    //     )
                    //   ] else if (panduanIndex == 7) ...[
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: gopay.map((e) => textList(e)).toList(),
                    //     )
                    //   ] else if (panduanIndex == 8) ...[
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: gopay.map((e) => textList(e)).toList(),
                    //     )
                    //   ] else if (panduanIndex == 9) ...[
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: gopay.map((e) => textList(e)).toList(),
                    //     )
                    //   ]
                    // ]),
                    )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Container textList(String e) {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 20),
        child: Text(
          e,
          style: TextStyle(fontSize: 16),
        ));
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hour = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      '$hour Jam : $minutes Menit : $seconds Detik',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
