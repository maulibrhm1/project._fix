part of 'notes_components.dart';

class AddActivity extends StatefulWidget {
  const AddActivity({
    Key? key,
  }) : super(key: key);

  @override
  State<AddActivity> createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  @override
  Widget build(BuildContext context) {
    return NotesButton(
      touch: () async {
        setState(() {});
        await Get.to(const AddActivityPage(
          addController: true,
          updateController: false,
        ));
      },
      icon: Icons.add,
      label: '',
      width: 30,
    );
  }
}
