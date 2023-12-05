import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Constants/colors.dart';

class ReusableDropdown extends StatelessWidget {
  final dynamic value;
  final List<dynamic> items;
  final Function(dynamic)? onChanged;
  final String hint;

  const ReusableDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 74.h,
      child: DropdownButtonFormField(
        iconEnabledColor: primaryColor,
        decoration: InputDecoration(
            filled: true,
            fillColor: HexColor('#F2F2F2'),
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: InputBorder.none),
        focusColor: Colors.transparent,
        isExpanded: true,
        validator: (value) {
          if (value == null) {
            return 'Please select a value';
          }
          return null;
        },
        hint: Text(
          hint,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            fontStyle: FontStyle.normal,
            color: HexColor('#000000'),
          ),
        ),
        iconSize: 30.w,
        elevation: 0,
        value: value,
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e.toString(),
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      fontStyle: FontStyle.normal,
                      color: HexColor('#000000'),
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
