import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Constants/colors.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final bool? fill;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final double? fontSize;
  final String? labelText;
  final int? maxLines;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? fillColor;
  final TextInputType? textInputType;

  final String? Function(String?)? validator;
  final void Function()? onTap;
  const MyTextFormField({
    super.key,
    this.maxLines,
    this.readOnly,
    this.textInputType,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.fontWeight,
    this.fill,
    this.fontSize,
    this.onTap,
    this.width,
    this.height,
    this.controller,
    this.fillColor,
    this.validator,
    required this.hintText,
    this.labelTextColor,
    required this.labelText,
    this.hintTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 531.w,
      // height: height??43.h,
      child: TextFormField(
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500, fontSize: 24.sp, letterSpacing: 0.05),
        keyboardType: textInputType,
        textAlign: TextAlign.left,
        onTap: onTap,
        validator: validator,
        maxLines: maxLines ?? 1,
        controller: controller,
        cursorColor: primaryColor,
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: HexColor('#262626')),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: HexColor('#262626')),
          ),
          // enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixIconColor: primaryColor,
          labelStyle: GoogleFonts.ubuntu(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              color: HexColor('#262626')),
          hintStyle: TextStyle(
            fontStyle: FontStyle.normal,
            color: hintTextColor ?? HexColor("#262626"),
            fontWeight: FontWeight.w500,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
