part of 'pendaftaran.dart';

class UnregisteredPage extends StatelessWidget {
  final String title;
  const UnregisteredPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: Colors.tealAccent[700],
          // ignore: prefer_const_literals_to_create_immutables
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 8),
          child: Center(
              child: Column(
            children: [
              const SizedBox(height: 100),
              Image.asset("assets/images/failed.png"),
              Text(
                "Mohon maaf kamu tidak bisa mengakses halaman ini\n Pergi kehalaman status untuk mendaftar",
                style: TextStyles(context)
                    .getRegularStyle()
                    .copyWith(fontSize: 24, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              )
            ],
          )),
        ));
  }
}
