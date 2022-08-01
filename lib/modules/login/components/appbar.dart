part of 'login_components.dart';

class Appbar extends StatelessWidget {
  final Function()? onTap;
  const Appbar({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonAppbarView(
      iconData: Icons.arrow_back,
      onBackClick: () {
        Get.back();
      },
    );
  }
}
