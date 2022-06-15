// ignore_for_file: prefer_const_constructors, file_names

part of 'status_components.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;
  const ProfileWidget(
      {Key? key, required this.imagePath, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 40, 0, 24),
        child: Stack(children: [
          buildImage(),
          Positioned(bottom: 0, right: 4, child: buildAddIcon(color))
        ]),
      ),
    );
  }

  buildImage() {
    final image = AssetImage(imagePath);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 120,
          height: 120,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  buildAddIcon(Color color) => buildCircle(
        color: Colors.tealAccent.shade700,
        all: 0,
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      );

  buildCircle(
          {required Widget child, required double all, required Color color}) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
