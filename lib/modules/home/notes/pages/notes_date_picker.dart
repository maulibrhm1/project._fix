// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member

part of 'notes.dart';

class NotesDatePicker extends StatefulWidget {
  const NotesDatePicker({Key? key}) : super(key: key);

  @override
  State<NotesDatePicker> createState() => _NotesDatePickerState();
}

class _NotesDatePickerState extends State<NotesDatePicker> {
  var dayPicker = DateFormat.EEEE().format(DateTime.now());

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
                            onTap: (() =>
                                Navigator.of(context).push((MaterialPageRoute(
                                  builder: (context) => NotesDateTable(),
                                )))),
                            child: Icon(
                              Icons.calendar_month,
                              color: Colors.grey[300],
                              size: 30,
                            ),
                          ),
                          GestureDetector(
                            onTap: null,
                            child: Icon(
                              Icons.date_range,
                              color: AppTheme.mainColor,
                              size: 30,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DatePicker(
                    DateTime.now(),
                    height: 80,
                    width: 80,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppTheme.mainColor,
                    dateTextStyle: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            AddKegiatanColumn()
          ],
        )),
      ),
    );
  }

  @override
  bool get wantkeepAlive => true;
}
