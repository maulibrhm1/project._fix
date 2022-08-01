part of 'topup_components.dart';

class MenuPembayaran extends StatelessWidget {
  final Image image;
  final Function onTap;
  const MenuPembayaran({
    Key? key,
    required this.onTap,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: size.width * 0.5,
        height: size.height * 0.15,
        child: image,
        decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.grey.shade300)),
      ),
    );
  }
}
