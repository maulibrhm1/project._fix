// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member

part of 'notes.dart';

class NotesDatePicker extends StatefulWidget {
  const NotesDatePicker({Key? key}) : super(key: key);

  @override
  State<NotesDatePicker> createState() => _NotesDatePickerState();
}

class _NotesDatePickerState extends State<NotesDatePicker> {
  // final _activityController = Get.put(ActivityController());

  final Stream<QuerySnapshot> _activityStream =
      FirebaseFirestore.instance.collection("activity").snapshots();
  var dayPicker = DateFormat.EEEE().format(DateTime.now());
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Kegiatan'),
        centerTitle: true,
        backgroundColor: Colors.tealAccent[700],
        // ignore: prefer_const_literals_to_create_immutables
      ),
      body: Scaffold(
        body: Background(
            child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 20),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Spacer(
                        flex: 4,
                      ),
                      Text(
                        DateFormat.MMMM().format(DateTime.now()),
                        style: TextStyle(fontSize: 30),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Row(
                        children: [
                          CupertinoButton(
                              child: Icon(
                                Icons.calendar_month,
                                color: Colors.grey[300],
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            NotesDateTable()));
                              }),
                          GestureDetector(
                            onTap: null,
                            child: Icon(
                              Icons.date_range,
                              color: AppTheme.mainColor,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DatePicker(
                    DateTime(2022, DateTime.april),
                    height: 80,
                    width: 80,
                    initialSelectedDate: DateTime.now(),
                    deactivatedColor: Colors.grey,
                    selectionColor: AppTheme.mainColor,
                    dateTextStyle: TextStyle(fontSize: 20),
                    onDateChange: (date) {
                      setState(() {
                        _selectedDay = date;
                      });
                    },
                  )
                ],
              ),
              ShowActivity(),
              AddActivity()
            ],
          ),
        )),
      ),
    );
  }

  // _showActivity() {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   CollectionReference activities = firestore.collection("activity");
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 20),
  //     child: StreamBuilder<QuerySnapshot>(
  //         stream: _activityStream,
  //         builder: (_, snapshot) {
  //           if (snapshot.hasError) {
  //             print('data error');
  //           }
  //           if (snapshot.connectionState == ConnectionState.waiting) {
  //             return Center(
  //               child: CircularProgressIndicator(),
  //             );
  //           }
  //           return Expanded(
  //             child: CustomScrollView(
  //               scrollDirection: Axis.vertical,
  //               shrinkWrap: true,
  //               slivers: [
  //                 SliverList(
  //                     delegate: SliverChildBuilderDelegate((_, index) {
  //                   return snapshot.data!.docs[index]["date"] ==
  //                           DateFormat.yMd().format(_selectedDay)
  //                       ? ItemCard(
  //                           date: snapshot.data!.docs[index]["date"],
  //                           kegiatan: snapshot.data!.docs[index]["activity"],
  //                           color: snapshot.data!.docs[index]["color"],
  //                           startTime: snapshot.data!.docs[index]["startTime"],
  //                           endTime: snapshot.data!.docs[index]["endTime"],
  //                           onDelete: () {
  //                             activities
  //                                 .doc(snapshot.data!.docs[index].id)
  //                                 .delete();
  //                             setState(() {
  //                               Get.back();
  //                             });
  //                           },
  //                         )
  //                       : Container();
  //                 }, childCount: snapshot.data!.docs.length))
  //               ],
  //             ),
  //           );
  //         }),
  //   );
  // }
}
