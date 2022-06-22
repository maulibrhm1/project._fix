part of 'beranda_components.dart';

class IconBeranda extends StatelessWidget {
  final IconData icon;
  const IconBeranda({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
        size: 50,
        color: AppTheme.mainColor,
      ),
    );
  }
}
