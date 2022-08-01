part of 'beranda_components.dart';

class BigButton extends StatelessWidget {
  final int? labelIndex;
  final int? colorIndex;
  final IconData? icon;
  final String? label;
  final Function()? onTap;
  const BigButton(
      {Key? key,
      this.labelIndex,
      this.colorIndex,
      this.icon,
      this.label,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
          width: 200,
          height: 200,
          margin: EdgeInsets.all(8.0),
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              icon,
              color: Colors.black,
              size: 100,
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: changeLabel[labelIndex!],
            )
          ]),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    bigButtonColor[colorIndex!],
                  ]),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(5, 15),
                )
              ])),
    );
  }
}
