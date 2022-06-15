part of 'notes_components.dart';

class AddKegiatanColumn extends StatelessWidget {
  const AddKegiatanColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            DateFormat.EEEE().format(DateTime.now()),
            style: TextStyle(fontSize: 20),
          ),
        ),
        NotesButton(
          touch: () => Navigator.push(context,
              CupertinoPageRoute(builder: (context) => AddKegiatanPage())),
          icon: Icons.add,
          label: '',
          width: 30,
        ),
      ],
    );
  }
}
