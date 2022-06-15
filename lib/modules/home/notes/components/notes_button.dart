part of "notes_components.dart";

class NotesButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final double? width;
  final double? height;
  final Function()? touch;
  const NotesButton({
    Key? key,
    required this.touch,
    required this.label,
    this.icon,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: touch,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppTheme.mainColor),
        // ignore: prefer_const_constructors
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            // ignore: prefer_const_constructors
            child: Container(
              width: width,
              height: height,
              child: Row(
                children: [
                  Text(
                    label,
                    textAlign: TextAlign.center,
                  ),
                  Icon(
                    icon,
                    size: 30,
                    color: Colors.white,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
