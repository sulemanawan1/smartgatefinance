import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartgatefinance/Constants/size_box.dart';
import 'package:smartgatefinance/Pages/Login/controller/login_controller.dart';
import 'package:smartgatefinance/Widgets/My%20Button/my_button.dart';
import 'package:smartgatefinance/Widgets/My%20Password%20TextForm%20Field/my_password_textform_field.dart';
import 'package:smartgatefinance/Widgets/My%20TextForm%20Field/my_textform_field.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/validations.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
            backgroundColor: HexColor('#F5F5F5'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/Rectangle 1.png',
                        alignment: Alignment.topLeft,
                        fit: BoxFit.cover,
                        width: 850.w,
                      ),
                      Flexible(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              27.h.ph,
                              SvgPicture.asset(
                                'assets/login_vector_2.svg',
                                width: 387.91.h,
                                height: 387.91.h,
                              ),
                              69.09.h.ph,
                              Text(
                                "Log In",
                                style: GoogleFonts.montserrat(
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.w600,
                                    color: secondaryColor),
                              ),
                              48.h.ph,
                              MyTextFormField(
                                  controller: controller.cnicController,
                                  validator: emptyStringValidator,
                                  hintText: 'CNIC',
                                  labelText: 'CNIC'),
                              55.h.ph,
                              MyPasswordTextFormField(
                                  togglePasswordView:
                                      controller.togglePasswordView,
                                  validator: emptyStringValidator,
                                  controller: controller.passwordController,
                                  hintText: 'Password',
                                  labelText: 'Password',
                                  obscureText: controller.isHidden),
                              87.h.ph,
                              MyButton(
                                loading: controller.loading,
                                name: 'Log In',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (controller.loading == false) {
                                      print("here");
                                      controller.loginApi(
                                          cnic: controller.cnicController.text,
                                          password: controller
                                              .passwordController.text);
                                    }
                                  }

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => HomePage()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
