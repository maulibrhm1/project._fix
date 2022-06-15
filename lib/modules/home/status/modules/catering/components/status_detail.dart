part of 'catering.dart';

class StatusDetail extends StatelessWidget {
  final StatusData statusData;
  const StatusDetail({Key? key, required this.statusData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelStatus('${statusData.labelAlamat}'),
        Text('${statusData.alamat}'),
        labelStatus('${statusData.labelDurasi}'),
        Text('${statusData.durasi}'),
      ],
    );
  }

  labelStatus(String labelTxt) => Text(
        labelTxt,
      );
}
