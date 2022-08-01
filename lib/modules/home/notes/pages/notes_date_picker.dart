// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member

part of 'notes.dart';

class NotesDatePicker extends StatefulWidget {
  const NotesDatePicker({Key? key}) : super(key: key);

  @override
  State<NotesDatePicker> createState() => _NotesDatePickerState();
}

class _NotesDatePickerState extends State<NotesDatePicker> {
  // final _activityController = Get.put(ActivityController());

  final Stream<QuerySnapshot> _activityStream = FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("activity")
      .snapshots();
  CollectionReference activities = firestore.collection("activity");
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
            child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 20, bottom: 40),
              child: Column(
                children: [
                  _header(),
                  _datePicker(),
                  _showActivity(),
                  AddActivity()
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  _datePicker() {
    return DatePicker(
      DateTime(2022, DateTime.march, 14),
      height: 80,
      width: 80,
      initialSelectedDate: DateTime.now(),
      daysCount: 117,
      deactivatedColor: Colors.grey,
      selectionColor: AppTheme.primaryColor,
      dateTextStyle: TextStyle(fontSize: 20),
      onDateChange: (date) {
        setState(() {
          _selectedDay = date;
        });
      },
    );
  }

  _header() {
    return Row(
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
                          builder: (context) => NotesDateTable()));
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
    );
  }

  _showActivity() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: StreamBuilder<QuerySnapshot>(
          stream: _activityStream,
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              print('data error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate((_, index) {
                  ActivityModel activityModel =
                      ActivityModel.fromJson(snapshot.data!.docs[index]);
                  return snapshot.data!.docs[index]["date"] ==
                          DateFormat.yMd().format(_selectedDay)
                      ? ItemCard(
                          activityModel,
                          date: snapshot.data!.docs[index]["date"],
                          kegiatan: snapshot.data!.docs[index]["activity"],
                          color: snapshot.data!.docs[index]["color"],
                          startTime: snapshot.data!.docs[index]["startTime"],
                          endTime: snapshot.data!.docs[index]["endTime"],
                          onDelete: () {
                            print(
                                "Deleting field ${snapshot.data!.docs[index].id}");
                            activities
                                .doc(snapshot.data!.docs[index].id)
                                .delete();
                            setState(() {
                              Get.back();
                            });
                          },
                        )
                      : Container();
                }, childCount: snapshot.data!.docs.length))
              ],
            );
          }),
    );
  }
}
