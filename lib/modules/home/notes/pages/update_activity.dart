// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

part of "notes.dart";

class UpdateActivityPage extends StatefulWidget {
  final Function()? onUpdate;
  const UpdateActivityPage({Key? key, this.onUpdate}) : super(key: key);

  @override
  State<UpdateActivityPage> createState() => _UpdateActivityPageState();
}

class _UpdateActivityPageState extends State<UpdateActivityPage> {
  // final ActivityController _activityController = Get.put(ActivityController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController _kegiatanController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endTime = "05:00 PM";
  int _selectedColor = 0;
  bool _visible = false;

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
          SizedBox(
            width: size.width,
            height: size.height,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.only(left: 30, right: 30),
              // ignore: prefer_const_literals_to_create_immutables
              child: Form(
                key: _formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'Tambah Kegiatan',
                        style: TextStyles(context).getTitleStyle(),
                      ),
                      NotesInputField(
                        width: size.width * 0.9,
                        title: 'Kegiatan',
                        hint: 'Masukan Kegiatan',
                        controller: _kegiatanController,
                        maxLines: 8,
                      ),
                      SizedBox(height: 10),
                      ValidationText(
                        visible: _visible,
                        text: 'Isian tidak boleh kosong',
                      ),
                      NotesInputField(
                        title: "Tanggal",
                        hint: DateFormat.yMd().format(_selectedDate),
                        widget: IconButton(
                          onPressed: () {
                            _getDateFromUser();
                          },
                          icon: Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: NotesInputField(
                              title: "Jam Mulai",
                              hint: _startTime,
                              widget: IconButton(
                                icon: Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  _getTimeFromUser(isStartTime: true);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: NotesInputField(
                              title: "Jam Selesai",
                              hint: _endTime,
                              widget: IconButton(
                                icon: Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  _getTimeFromUser(isStartTime: false);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _colorPallette(),
                          SaveButton(
                            label: "Simpan",
                            onTap: _validateDate(update: widget.onUpdate),
                          )
                        ],
                      ),
                    ]),
              ),
            ),
          )
        ],
      )),
    );
  }

  _colorPallette() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color'),
        SizedBox(
          height: 10,
        ),
        Wrap(
          children: List<Widget>.generate(3, (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? AppTheme.primaryColor
                      : index == 1
                          ? Colors.amber
                          : Colors.grey,
                  child: _selectedColor == index
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 16,
                        )
                      : Container(),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  _validateDate({Function()? update}) {
    CollectionReference activities = firestore.collection('activity');
    if (_kegiatanController.text.isNotEmpty) {
      setState(() {
        _visible = false;
        update;
        // activities.doc().update({
        //   "activity": _kegiatanController.text,
        //   "date": DateFormat.yMd().format(_selectedDate),
        //   "startTime": _startTime,
        //   "endTime": _endTime,
        //   "color": _selectedColor,
        //   "isCompleted": 0,
        // });
        Get.back();
        // Navigator.pop(context);
      });
    } else if (_kegiatanController.text.isEmpty) {
      setState(() {
        _visible = true;
      });
    }
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2023),
    );

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var _pickedTime = await _showTimePicker();
    String _formatedTime = _pickedTime.format(context);
    if (_pickedTime == null) {
      print("Picking Time Canceled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split("")[0])));
  }
}
