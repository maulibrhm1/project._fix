part of 'catering.dart';

class CateringOrderDetail extends StatelessWidget {
  const CateringOrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.primaryColor),
      body: Background(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('data'), Text('data')],
          )
        ]),
      )),
    );
  }
}
