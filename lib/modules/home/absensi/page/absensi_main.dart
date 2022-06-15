// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

part of 'absensi.dart';

class AbsensiMain extends StatefulWidget {
  const AbsensiMain({Key? key}) : super(key: key);

  @override
  State<AbsensiMain> createState() => _AbsensiMainState();
}

class _AbsensiMainState extends State<AbsensiMain> {
  DateTime _selectedDate = DateTime.now();
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
        child: ListView(children: [
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 50, bottom: 30),
                  child: Column(
                    children: [
                      CalendarTimeline(
                        activeBackgroundDayColor: AppTheme.primaryColor,
                        dayColor: AppTheme.primaryColor,
                        dotsColor: AppTheme.primaryColor,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022, 1, 1),
                        lastDate: DateTime(2022, 12, 31),
                        onDateSelected: (date) {
                          print(date);
                        },
                      ),
                    ],
                  )),
              Table(
                  border: TableBorder.all(color: Colors.grey.shade400),
                  columnWidths: {
                    0: FractionColumnWidth(.2),
                    1: FractionColumnWidth(.25),
                    2: FractionColumnWidth(.16),
                    3: FractionColumnWidth(.19),
                    4: FractionColumnWidth(.2)
                  },
                  children: [
                    TableRow(
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        children: [
                          itemAbsensi(
                            text: 'Masuk',
                          ),
                          itemAbsensi(
                            text: 'Istirahat',
                          ),
                          itemAbsensi(
                            text: 'Izin',
                          ),
                          itemAbsensi(
                            text: 'Pulang',
                          ),
                          itemAbsensi(
                            text: 'Total',
                          ),
                        ]),
                    TableRow(children: [
                      itemAbsensi(text: '06.26'),
                      itemAbsensi(text: '0 menit'),
                      itemAbsensi(text: '0 menit'),
                      itemAbsensi(text: '13.00'),
                      itemAbsensi(text: '7 jam 26 Menit'),
                    ])
                  ]),
              Table(children: [])
            ],
          )
        ]),
      )),
    );
  }
}

class itemAbsensi extends StatelessWidget {
  final String text;
  const itemAbsensi({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Text(
        text,
        style: TextStyle(fontSize: 16),
      )),
    );
  }
}
