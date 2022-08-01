part of 'pendaftaran_components.dart';

class CommonRadioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final Function(int) onChanged;
  const CommonRadioButton(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _value = 1;
    return Radio(
        activeColor: AppTheme.primaryColor,
        value: value,
        groupValue: groupValue,
        onChanged: (value) {
          onChanged;
        });
  }
}
