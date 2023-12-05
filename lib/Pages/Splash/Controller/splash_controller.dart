import 'dart:async';

import 'package:get/get.dart';
import 'package:smartgatefinance/Routes/set_routes.dart';

import '../../../Model/User.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // MySharedPreferences.deleteUserData();
    getUserSharedPreferencesData();
  }

  void getUserSharedPreferencesData() async {
    User user = await MySharedPreferences.getUserData();

    if (user.bearer == "" || user.bearer == "null") {
      Timer(const Duration(seconds: 3), () => Get.offAndToNamed(login));
    } else {
      print(user.data!.id);
      Timer(const Duration(seconds: 2),
          () => Get.offAndToNamed(homePage, arguments: user));
    }
  }
}
