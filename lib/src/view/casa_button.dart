import 'package:casa_flutter_feedback/config/colors.dart';
import 'package:casa_flutter_feedback/config/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CasaButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Size? size;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;
  final Color backgroundColor;
  // final TextStyle textStyle;
  final double? elevation;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  const CasaButton({
    required this.text,
    this.icon,
    this.size,
    this.padding,
    this.onPressed,
    this.backgroundColor = primaryColor,
    this.elevation,
    this.fontSize = 16,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.w500,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        onSurface: backgroundColor,
        minimumSize: size ?? Size(132.w, 38.h),
        padding: padding,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius2),
        ),
      ),
      child: icon ??
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
              fontWeight: fontWeight,
            ),
          ),
    );
  }
}
