// ignore_for_file: prefer_const_constructors

part of 'notes_components.dart';

class NotesInputField extends StatelessWidget {
  final String title;
  final String hint;
  final double? height;
  final double? width;
  final int? maxLines;
  final String? Function(String?)? validate;

  final TextEditingController? controller;
  final Widget? widget;

  const NotesInputField({
    Key? key,
    this.widget,
    required this.title,
    required this.hint,
    this.controller,
    this.height,
    this.validate,
    this.width,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title),
        Container(
          margin: EdgeInsets.only(top: 8.0),
          padding: EdgeInsets.all(8.0),
          height: height,
          width: width,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: TextFormField(
                      maxLines: maxLines,
                      validator: validate,
                      readOnly: widget == null ? false : true,
                      autofocus: false,
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: hint,
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0),
                          )))),
              widget == null
                  ? Container()
                  : Container(
                      child: widget,
                    )
            ],
          ),
        )
      ]),
    );
  }
}
