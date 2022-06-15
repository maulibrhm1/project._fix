part of 'topup_components.dart';

class menuTopup extends StatelessWidget {
  final String text;
  final Function onTap;
  const menuTopup({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 52),
        child: Text(text),
        decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.grey.shade300)),
      ),
    );
  }
}
