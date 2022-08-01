part of 'beranda_components.dart';

class outputItem extends StatelessWidget {
  AttendanceModel attendanceModel;
  final IconData? icon;
  final String? text;
  outputItem(this.attendanceModel, {Key? key, this.icon, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        IconBeranda(icon: icon!),
        Text(
          text!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
