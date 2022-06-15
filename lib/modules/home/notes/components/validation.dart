part of 'notes_components.dart';

class ValidationText extends StatelessWidget {
  const ValidationText({
    Key? key,
    required bool visible,
    required this.text,
    this.width,
  })  : _visible = visible,
        super(key: key);

  final bool _visible;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Visibility(
          visible: _visible,
          child: Row(
            children: [
              Icon(
                Icons.warning_amber_outlined,
                color: Colors.red,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.red),
              )
            ],
          )),
    );
  }
}
