part of 'notes_components.dart';

class SaveButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const SaveButton({
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
