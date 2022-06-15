// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

part of 'notes.dart';

class NotesDateTable extends StatefulWidget {
  const NotesDateTable({Key? key}) : super(key: key);

  @override
  State<NotesDateTable> createState() => _NotesDateTableState();
}

class _NotesDateTableState extends State<NotesDateTable> {
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
          // ignore: prefer_const_literals_to_create_immutables
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
                    AddKegiatanColumn()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _calendarTable(BuildContext context, Size size) {
    return Container(
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
                      color: Color.fromARGB(255, 40, 175, 112),
                      shape: BoxShape.circle),
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
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}

Route CustomPageRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const NotesDatePicker(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
