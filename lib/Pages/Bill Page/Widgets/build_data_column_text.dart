import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class BuildDataColumnText extends StatelessWidget {
  final String? text;

  const BuildDataColumnText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text!,
        style: GoogleFonts.inder(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            fontStyle: FontStyle.normal,
            color: HexColor('#262626')),
      ),
    );
  }
}
