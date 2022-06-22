part of 'notes_components.dart';

class ShowActivity extends StatefulWidget {
  const ShowActivity({Key? key}) : super(key: key);

  @override
  State<ShowActivity> createState() => _ShowActivityState();
}

class _ShowActivityState extends State<ShowActivity> {
  final Stream<QuerySnapshot> _activityStream = FirebaseFirestore.instance
      .collection("activity")
      .orderBy("startTime")
      .snapshots();
  final TextEditingController _kegiatanController = TextEditingController();
  final DateTime _selectedDay = DateTime.now();
  final DateTime _selectedDate = DateTime.now();
  final String _startTime =
      DateFormat("hh:mm a").format(DateTime.now()).toString();
  final String _endTime = "05:00 PM";
  final int _selectedColor = 0;
  final bool _visible = false;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference activities = firestore.collection("activity");
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: StreamBuilder<QuerySnapshot>(
          stream: _activityStream,
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              print('data error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Expanded(
              child: CustomScrollView(
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
              ),
            );
          }),
    );
  }
}
