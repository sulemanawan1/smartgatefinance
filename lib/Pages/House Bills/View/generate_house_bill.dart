import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartgatefinance/Constants/colors.dart';
import 'package:smartgatefinance/Constants/size_box.dart';
import 'package:smartgatefinance/Widgets/My%20App%20Bar/my_app_bar.dart';

import '../../../Constants/validations.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/generate_house_bill_controller.dart';

class GenerateHouseBill extends GetView {
  final _formKey = GlobalKey<FormState>();

  GenerateHouseBill({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateHouseBillController>(
        init: GenerateHouseBillController(),
        builder: (controller) {
          return SafeArea(
            child: WillPopScope(
              onWillPop: () async {
                return true;
              },
              child: Scaffold(
                appBar: const MyAppBar(title: 'House Bills'),
                body: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          30.h.ph,
                          SvgPicture.asset(
                            'assets/houses.svg',
                            width: 200.w,
                            height: 200.w,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                30.h.ph,
                                const BillDateHeading(title: 'Start Date'),
                                20.h.ph,
                                MyTextFormField(
                                  controller: controller.billStartDate,
                                  readOnly: true,
                                  suffixIcon: const Icon(Icons.date_range),
                                  fillColor: Colors.white,
                                  validator: emptyStringValidator,
                                  hintText: 'Choose Bill Start Date',
                                  labelText: 'Choose Bill Start Date',
                                ),
                                20.h.ph,
                                const BillDateHeading(title: 'End Date'),
                                20.h.ph,
                                MyTextFormField(
                                  controller: controller.billEndDate,
                                  readOnly: true,
                                  suffixIcon: const Icon(Icons.date_range),
                                  fillColor: Colors.white,
                                  validator: emptyStringValidator,
                                  hintText: 'Choose Bill END Date',
                                  labelText: 'Choose Bill END Date',
                                ),
                                20.h.ph,
                                const BillDateHeading(title: 'Due Date'),
                                20.h.ph,
                                MyTextFormField(
                                  controller: controller.billDueDate,
                                  readOnly: true,
                                  suffixIcon: const Icon(Icons.date_range),
                                  fillColor: Colors.white,
                                  validator: emptyStringValidator,
                                  hintText: 'Choose Bill Due Date',
                                  labelText: 'Choose Bill Due Date',
                                ),
                                20.h.ph,
                                MyButton(
                                  loading: controller.loading,
                                  name: 'Generate',
                                  onPressed: () async {
                                    if (!controller.loading) {
                                      controller.generateHouseBillApi(
                                          subAdminId: controller
                                              .homePageController
                                              .user
                                              .data!
                                              .subadminid,
                                          financeManagerId: controller
                                              .homePageController.user.data!.id,
                                          dueDate: controller.billDueDate.text,
                                          billStartDate:
                                              controller.billStartDate.text,
                                          billEndDate:
                                              controller.billEndDate.text,
                                          bearerToken: controller
                                              .homePageController.user.bearer);
                                    }
                                  },
                                ),
                                20.h.ph,
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class BillDateHeading extends StatelessWidget {
  final String? title;

  const BillDateHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: GoogleFonts.montserrat(
        fontSize: 18.sp,
        color: secondaryColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
