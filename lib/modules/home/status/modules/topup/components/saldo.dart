part of 'topup_components.dart';

class Saldo extends StatelessWidget {
  final String text;
  final Function press;
  const Saldo({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            press();
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(180, 70)),
              foregroundColor: MaterialStateProperty.all(Colors.black87),
              backgroundColor: MaterialStateProperty.all(Colors.orange[200]),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
        ),
      ],
    );
  }
}
