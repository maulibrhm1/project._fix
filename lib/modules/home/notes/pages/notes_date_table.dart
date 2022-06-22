// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

part of 'notes.dart';

class NotesDateTable extends StatefulWidget {
  const NotesDateTable({Key? key}) : super(key: key);

  @override
  State<NotesDateTable> createState() => _NotesDateTableState();
}

class _NotesDateTableState extends State<NotesDateTable> {
  // final _activityController = Get.put(ActivityController());
  final Stream<QuerySnapshot> _activityStream = FirebaseFirestore.instance
      .collection("activity")
      .orderBy("startTime")
      .snapshots();
  bool _visible = false;
  CalendarFormat _format = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Catatan Kegiatan'),
          centerTitle: true,
          backgroundColor: Colors.tealAccent[700],
        ),
        body: Background(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 20, bottom: 40),
                child: Column(
                  children: [
                    _calendarTable(context, size),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        DateFormat.EEEE().format(DateTime.now()),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ShowActivity(),
                    AddActivity(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  // _showActivity() {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   CollectionReference activities = firestore.collection("activity");
  //   Size size = MediaQuery.of(context).size;
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
  //                             print(
  //                                 "Deleting field ${snapshot.data!.docs[index].id}");
  //                             activities
  //                                 .doc(snapshot.data!.docs[index].id)
  //                                 .delete();
  //                             setState(() {
  //                               Get.back();
  //                             });
  //                           },
  //                           onUpdate: () {
  //                             print(
  //                                 "Updating field ${snapshot.data!.docs[index].id}");
  //                             activities
  //                                 .doc(snapshot.data!.docs[index].id)
  //                                 .update({
  //                               "activity": _kegiatanController.text,
  //                               "date": DateFormat.yMd().format(_selectedDate),
  //                               "startTime": _startTime,
  //                               "endTime": _endTime,
  //                               "color": _selectedColor,
  //                               "isCompleted": 0,
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

  // _addActivity() {
  //   return NotesButton(
  //     touch: () async {
  //       setState(() {
  //         _addController = true;
  //         _updateController = false;
  //       });
  //       await Get.to(const AddActivityPage(
  //         addController: true,
  //         updateController: false,
  //       ));
  //     },
  //     icon: Icons.add,
  //     label: '',
  //     width: 30,
  //   );
  // }

  _calendarTable(BuildContext context, Size size) {
    return Column(
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
                GestureDetector(
                  onTap: null,
                  child: Icon(
                    Icons.calendar_month,
                    color: AppTheme.mainColor,
                    size: 30,
                  ),
                ),
                CupertinoButton(
                    child: Icon(
                      Icons.date_range,
                      color: Colors.grey[300],
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => NotesDatePicker()));
                    })
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: size.width * 0.9,
          child: TableCalendar(
            focusedDay: _selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: _format,
            onFormatChanged: (format) {
              setState(() {
                _format = format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                    color: AppTheme.primaryColor, shape: BoxShape.circle),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 170, 170, 170),
                    shape: BoxShape.circle)),
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            selectedDayPredicate: (DateTime date) {
              return isSameDay(_selectedDay, date);
            },
          ),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        ),
      ],
    );
  }
}

CustomPageRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const NotesDatePicker(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
