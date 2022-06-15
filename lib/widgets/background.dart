import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/main-top.png"),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset("assets/images/main-bottom.png")),
          Positioned(
              top: size.height * 0.4,
              right: 0,
              child: Image.asset("assets/images/main-middle.png")),
          child,
        ],
      ),
    );
  }
}
