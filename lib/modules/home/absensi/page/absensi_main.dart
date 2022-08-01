// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

part of 'absensi.dart';

class AbsensiMain extends StatefulWidget {
  const AbsensiMain({Key? key}) : super(key: key);

  @override
  State<AbsensiMain> createState() => _AbsensiMainState();
}

class _AbsensiMainState extends State<AbsensiMain> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> jamKerja = FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("attendance")
      .snapshots();
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Absensi'),
        centerTitle: true,
        backgroundColor: Colors.tealAccent[700],
      ),
      body: Background(
          child: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(children: [
          Column(
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
                        initialDate: _selectedDate,
                        firstDate: DateTime(2022, 1, 1),
                        lastDate: DateTime(2022, 12, 31),
                        onDateSelected: (date) {
                          setState(() {
                            _selectedDate = date!;
                            print(_selectedDate);
                          });
                        },
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(10),
                child: StreamBuilder<QuerySnapshot>(
                    stream: jamKerja,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("something went wrong");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading...");
                      }
                      final data = snapshot.requireData;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.size,
                          itemBuilder: (_, index) {
                            return snapshot.data!.docs[index]["date"] ==
                                    DateFormat.yMd().format(_selectedDate)
                                ? Table(
                                    border: TableBorder.all(
                                        color: Colors.grey.shade400, width: 1),
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    columnWidths: {
                                        0: FractionColumnWidth(.1),
                                        1: FractionColumnWidth(.4),
                                      },
                                    children: [
                                        buildRow([
                                          'Masuk',
                                          '${snapshot.data!.docs[index]["masuk"]} WIB'
                                        ]),
                                        buildRow([
                                          'Istirahat',
                                          '${snapshot.data!.docs[index]["waktu_istirahat"]}'
                                        ]),
                                        buildRow([
                                          'Izin',
                                          '${snapshot.data!.docs[index]["waktu_izin"]}'
                                        ]),
                                        buildRow([
                                          "Pulang",
                                          '${snapshot.data!.docs[index]["pulang"]} WIB'
                                        ]),
                                        buildRow([
                                          'Total',
                                          '${snapshot.data!.docs[index]["total"]}'
                                        ]),
                                      ])
                                : Column(children: [
                                    Text("Data anda tidak ada"),
                                  ]);
                          });
                    }),
              ),
            ],
          )
        ]),
      )),
    );
  }

  Future<AttendanceModel?> readAttendance() async {
    final docAttendance =
        firestore.collection("attendance").doc("knw9C9tk64NjKost57GF");
    final snapshot = await docAttendance.get();
    if (snapshot.exists) {
      return AttendanceModel.fromJson(snapshot.data()!);
    }
    return null;
  }

  _tableAttendance(AttendanceModel attendanceModel) {
    return Table(
        border: TableBorder.all(color: Colors.grey.shade400, width: 1),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FractionColumnWidth(.3),
          1: FractionColumnWidth(.4),
        },
        children: [
          buildRow(['Masuk', '${attendanceModel.masuk} WIB']),
          buildRow(['Istirahat', '${attendanceModel.waktuIstirahat}']),
          buildRow(['Izin', '${attendanceModel.waktuIzin}']),
          buildRow(["Pulang", '${attendanceModel.pulang} WIB']),
          buildRow(['Total', '${attendanceModel.waktuTotal}']),
        ]);
  }

  TableRow buildRow(List<String> cells) => TableRow(
      children: cells
          .map((cells) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cells,
                  style: TextStyles(context).getRegularStyle(),
                ),
              ))
          .toList());
}
