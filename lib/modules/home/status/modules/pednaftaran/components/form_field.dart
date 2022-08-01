part of 'pendaftaran_components.dart';

class FormField extends StatelessWidget {
  const FormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 20,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(8.0)),
      child: TextFormField(),
    );
  }
}
