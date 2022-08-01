import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';

class CommonTextFieldView extends StatelessWidget {
  final String? titleText;
  final String? hintText;
  final String? validator;
  final double? width;
  final IconData? iconShow;
  final IconData? iconHide;
  final String? errorText;
  final Widget? widget;
  final Color? color;
  final bool isObscureText, isAllowTopTitleView;
  final EdgeInsetsGeometry padding;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const CommonTextFieldView({
    Key? key,
    this.hintText = '',
    this.isObscureText = false,
    this.padding = const EdgeInsets.only(),
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.isAllowTopTitleView = true,
    this.errorText,
    this.titleText = '',
    this.controller,
    this.iconShow,
    this.iconHide,
    this.onTap,
    this.widget,
    this.validator,
    this.color,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool emailField = false;

    bool _obscureText = true;
    bool passwordField = false;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isAllowTopTitleView && titleText != '')
            Container(
              width: size.width * 0.6,
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
              child: Text(
                titleText ?? "",
                style: TextStyles(context).getRegularStyle(),
                maxLines: 5,
              ),
            ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.black12.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.2,
            ),
            child: Container(
              color: color,
              padding: const EdgeInsets.only(left: 16),
              child: SizedBox(
                height: 48,
                width: width ?? size.width * 0.64,
                child: Center(
                  child: TextFormField(
                    controller: controller,
                    maxLines: 1,
                    onChanged: onChanged,
                    style: TextStyles(context).getRegularStyle(),
                    obscureText: isObscureText,
                    cursorColor: Theme.of(context).primaryColor,
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                      suffixIcon: widget,
                      errorText: null,
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle:
                          TextStyle(color: Theme.of(context).disabledColor),
                    ),
                    keyboardType: keyboardType,
                  ),
                ),
              ),
            ),
          ),
          if (errorText != null && errorText != '')
            Container(
              width: size.width * 0.66,
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
              child: Text(
                errorText ?? "",
                style: TextStyles(context)
                    .getDescriptionStyle()
                    .copyWith(color: AppTheme.redErrorColor, fontSize: 12),
              ),
            )
        ],
      ),
    );
  }
}
