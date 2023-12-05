import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Constants/colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final BuildContext context;
  final IconData? icon;
  final String? positiveButtonText;
  final String? negativeButtonText;
  Color? positiveButtonColor;
  Color? negativeButtonColor;
  final String? titleText;
  final Widget? child;
  final bool loading;

  final void Function()? onTapPositive;
  final void Function()? onTapNegative;

  CustomAlertDialog(
      {super.key,
      required this.context,
      this.icon,
      this.loading = false,
      this.positiveButtonText,
      this.negativeButtonText,
      this.positiveButtonColor,
      this.negativeButtonColor,
      this.titleText,
      this.child,
      this.onTapNegative,
      this.onTapPositive});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: whiteColor,
      surfaceTintColor: secondaryColor,
      actionsAlignment: MainAxisAlignment.center,
      scrollable: true,
      icon: Icon(
        icon,
        size: 40.h,
      ),
      iconColor: primaryColor,
      actions: [
        SizedBox(
          width: 147.w,
          height: 46.w,
          child: ElevatedButton(
              onPressed: onTapPositive ?? () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: positiveButtonColor ?? Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.r))),
              child: loading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(positiveButtonText ?? "Proceed",
                      style: GoogleFonts.montserrat(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: HexColor('#FFFFFF')),
                      textAlign: TextAlign.center)),
        ),
        SizedBox(
          width: 147.w,
          height: 46.w,
          child: ElevatedButton(
              onPressed: onTapNegative ??
                  () {
                    Get.back();
                  },
              style: ElevatedButton.styleFrom(
                  backgroundColor: negativeButtonColor ?? HexColor('#E4E4E4'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.r))),
              child: Text(negativeButtonText ?? "Cancel",
                  style: GoogleFonts.montserrat(
                    fontSize: 20.sp,
                    color: HexColor('#000000'),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center)),
        ),
      ],
      titleTextStyle: GoogleFonts.montserrat(
          fontSize: 20.sp, color: primaryColor, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      alignment: Alignment.center,
      title: Text(titleText ?? ""),
      content: SizedBox(
        width: 500.w,
        height: 500.w,
        child: child,
      ),
    );
  }
}
