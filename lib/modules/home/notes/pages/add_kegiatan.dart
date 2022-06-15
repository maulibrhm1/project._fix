// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

part of "notes.dart";

class AddKegiatanPage extends StatefulWidget {
  const AddKegiatanPage({Key? key}) : super(key: key);

  @override
  State<AddKegiatanPage> createState() => _AddKegiatanPageState();
}

class _AddKegiatanPageState extends State<AddKegiatanPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      NotesInputField(
                        height: 150,
                        title: 'Kegiatan',
                        hint: 'Masukan Kegiatan',
                        controller: _kegiatanController,
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
                          AddKegiatanButton(
                            label: 'Simpan',
                            onTap: () => _validateDate(),
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
                      ? AppTheme.mainColor
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

  _validateDate() {
    if (_kegiatanController.text.isNotEmpty) {
      setState(() {
        _visible = false;
        Navigator.pop(context);
      });
    } else if (_kegiatanController.text.isEmpty) {
      setState(() {
        _visible = true;
      });
    }
  }

  _addActivityToDb() {
    Activity(
      kegiatan: _kegiatanController.text,
      date: DateFormat.yMd().format(_selectedDate),
      startTime: _startTime,
      endTime: _endTime,
      color: _selectedColor,
      isCompleted: 0,
    );
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

class AddKegiatanButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const AddKegiatanButton({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(top: 14),
          padding: EdgeInsets.only(top: 10),
          height: 40,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppTheme.mainColor),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ));
  }
}
