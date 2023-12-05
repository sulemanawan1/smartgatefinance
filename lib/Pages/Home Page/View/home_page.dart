import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartgatefinance/Constants/size_box.dart';
import 'package:smartgatefinance/Pages/Home%20Page/Controller/home_page_controller.dart';
import 'package:smartgatefinance/Widgets/My%20App%20Bar/my_app_bar.dart';

import '../../../Constants/colors.dart';
import '../../../Model/User.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // print("build");

    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: whiteColor,
            appBar: const MyAppBar(title: 'Home'),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 104.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    57.h.ph,
                    Text(
                      "Finance Manager",
                      style: GoogleFonts.montserrat(
                          color: secondaryColor,
                          fontSize: 40.sp,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 70.h, 0, 0),
                              child: Wrap(
                                  spacing: 30.w,
                                  runSpacing: 40.w,
                                  children: controller.homePageLi.map((e) {
                                    return GestureDetector(
                                      onTap: () {
                                        homePageNavigation(
                                            user: controller.user,
                                            heading: e.heading);
                                      },
                                      child: SizedBox(
                                        width: 250.h,
                                        height: 293.h,
                                        child: Card(
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.r)),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                e.imageUrl.toString(),
                                                width: 220.51.h,
                                                height: 164.31.h,
                                              ),
                                              39.69.h.ph,
                                              Text(
                                                e.heading.toString(),
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor('#262626'),
                                                    fontSize: 24.sp,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList()),
                            ),
                          ),
                          86.w.pw,
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 30.h, 0, 0),
                              child: Image.asset(
                                'assets/home_page_vector.png',
                                width: 676.01.w,
                                height: 668.08.w,
                              ),
                            ),
                          ),
                          43.99.w.pw
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class HomePageList {
  final String? imageUrl;
  final String? heading;

  HomePageList({required this.imageUrl, required this.heading});
}

enum HomePageType { bills, generatebill, logout }

homePageNavigation({required String? heading, required User user}) {
  if (HomePageType.bills.name == heading!.toLowerCase()) {
    Get.toNamed(billPage, arguments: user);
  }
  if (HomePageType.generatebill.name == heading!.toLowerCase()) {
    Get.toNamed(generateBillPage, arguments: user);
  } else if (HomePageType.logout.name == heading.toLowerCase()) {
    MySharedPreferences.deleteUserData();
    Get.offAllNamed(login);
  }
}
