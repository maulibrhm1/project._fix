part of 'beranda_components.dart';

List<Widget> changeLabel = [
  ChangeLabelItem(
    text: 'Masuk',
  ),
  ChangeLabelItem(
    text: 'Istirahat\nKeluar',
  ),
  ChangeLabelItem(
    text: 'Istirahat\nMasuk',
  ),
  ChangeLabelItem(
    text: 'Izin Keluar',
  ),
  ChangeLabelItem(
    text: 'Kembali',
  ),
  ChangeLabelItem(
    text: 'Pulang',
  ),
];

class ChangeLabelItem extends StatelessWidget {
  final String text;
  const ChangeLabelItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
