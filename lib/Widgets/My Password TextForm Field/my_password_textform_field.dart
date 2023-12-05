import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Constants/colors.dart';

class MyPasswordTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? fillcolor;
  final bool obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function()? togglePasswordView;

  const MyPasswordTextFormField(
      {super.key,
      this.maxLines,
      this.contentPadding,
      this.fontWeight,
      this.controller,
      this.width,
      this.height,
      this.hintText,
      this.labelText,
      this.labelTextColor,
      this.hintTextColor,
      this.fillcolor,
      required this.obscureText,
      this.validator,
      this.onTap,
      this.togglePasswordView});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 531.w,
      // height: height??43.h,
      child: TextFormField(
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500, fontSize: 24.sp, letterSpacing: 0.05),
        onTap: onTap,
        validator: validator,
        obscureText: obscureText,
        maxLines: maxLines ?? 1,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: HexColor('#262626')),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: HexColor(
              '#262626',
            )),
          ),
          suffix: GestureDetector(
              onTap: togglePasswordView,
              child: obscureText
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 17.w, 0),
                      child: SvgPicture.asset(
                        'assets/eye_closed.svg',
                        fit: BoxFit.scaleDown,
                        width: 30,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 17.w, 0),
                      child: SvgPicture.asset(
                        "assets/eye_opened.svg",
                        fit: BoxFit.scaleDown,
                        width: 30,
                      ),
                    )),
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
