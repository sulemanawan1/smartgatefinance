import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartgatefinance/Constants/size_box.dart';
import 'package:smartgatefinance/Routes/set_routes.dart';
import 'package:smartgatefinance/Widgets/My%20App%20Bar/my_app_bar.dart';

import '../../../Constants/colors.dart';
import '../Controller/bills_controller.dart';

class GenerateBills extends StatelessWidget {
  const GenerateBills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateBillController>(
        init: GenerateBillController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              appBar: const MyAppBar(title: 'Generate Bill'),
              body: Padding(
                padding: EdgeInsets.only(left: 104.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      57.h.ph,
                      Text(
                        "Smart Billing Solutions for\nApartments and Houses",
                        style: GoogleFonts.montserrat(
                            color: secondaryColor,
                            fontSize: 40.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                      72.h.ph,
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: controller.list
                              .map((e) => GenerateBillCard(
                                  onTap: () {
                                    print(e.text!.trim().toLowerCase());

                                    if (e.text!.trim().toLowerCase() ==
                                        "house bills") {
                                      Get.toNamed(generateHouseBillPage);
                                    } else if (e.text!.trim().toLowerCase() ==
                                        "apartment bills") {
                                      Get.toNamed(
                                          generateSocietyApartmentBillsPage);
                                    }
                                  },
                                  text: e.text,
                                  svgImgUrl: e.svgImageUrl))
                              .toList()),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class GenerateBillCard extends StatelessWidget {
  final String? text;
  final String? svgImgUrl;
  void Function()? onTap;

  GenerateBillCard(
      {super.key, required this.text, required this.svgImgUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 340.w,
        height: 200.w,
        child: Card(
          elevation: 0.8,
          child: Column(
            children: [
              10.h.ph,
              Text(
                text!,
                style: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              10.h.ph,
              SvgPicture.asset(
                svgImgUrl!,
                width: 100.w,
                height: 100.w,
              ),
              10.h.ph,
            ],
          ),
        ),
      ),
    );
  }
}
