// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

part of 'topup.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({Key? key}) : super(key: key);

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
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
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'Top up Saldo',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Container(
            height: size.height * 0.55,
            padding: const EdgeInsets.all(14),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                _buildTable(),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Table _buildTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade400, width: 1),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        buildRow(["Rp 50.000", "Rp 100.000"], onTap: () {
          Get.to(() => MetodePembayaran());
        }),
        buildRow(["Rp 150.000", "Rp 200.000"], onTap: () {
          Get.to(() => MetodePembayaran());
        }),
        buildRow(["Rp 250.000", "Rp 300.000"], onTap: () {
          Get.to(() => MetodePembayaran());
        }),
        buildRow(["Rp 350.000", "Rp 400.000"], onTap: () {
          Get.to(() => MetodePembayaran());
        }),
        buildRow(["Rp 450.000", "Rp 500.000"], onTap: () {
          Get.to(() => MetodePembayaran());
        }),
      ],
    );
  }

  buildRow(List<String> cells, {Function()? onTap}) => TableRow(
      children: cells
          .map((cells) => InkWell(
                onTap: onTap,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      cells,
                      style: TextStyles(context).getRegularStyle(),
                    ),
                  ),
                ),
              ))
          .toList());
}
