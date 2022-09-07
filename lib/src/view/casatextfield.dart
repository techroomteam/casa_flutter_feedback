import 'package:casa_flutter_feedback/config/colors.dart';
import 'package:casa_flutter_feedback/config/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CasaTextField extends StatelessWidget {
  final Color color;
  final String hintText;
  final int maxLines;
  final bool? enabled;
  final bool? obscureText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  const CasaTextField({
    this.hintText = 'Washing machine not starting.',
    this.enabled = true,
    this.obscureText = false,
    this.color = appBackgroundColor,
    this.maxLines = 1,
    this.hintStyle,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,
      enabled: enabled,
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16, top: 16).r,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: appBackgroundColor, width: 0.0),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 0.7)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius3),
          borderSide: BorderSide.none,
        ),
        fillColor: color,
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
