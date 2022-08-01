import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/tap_effect.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final String? buttonText;
  final Widget? buttonTextWidget;
  final Color? textColor, backgroundColor;
  final bool? isClickable;
  final double radius;
  final double? width;
  const CommonButton({
    Key? key,
    this.onTap,
    this.buttonText,
    this.buttonTextWidget,
    this.textColor: Colors.white,
    this.backgroundColor,
    this.padding,
    this.isClickable = true,
    this.radius = 24,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: padding ?? const EdgeInsets.only(),
      child: TapEffect(
        isClickable: isClickable!,
        onClick: onTap ?? () {},
        child: SizedBox(
          height: 48,
          width: width ?? size.width * 0.4,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: backgroundColor ?? Colors.orange[300],
            shadowColor: Colors.black12.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.2,
            ),
            child: Center(
              child: buttonTextWidget ??
                  Text(
                    buttonText ?? "",
                    style: TextStyles(context).getRegularStyle().copyWith(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
