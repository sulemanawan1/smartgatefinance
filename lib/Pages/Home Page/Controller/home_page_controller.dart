import 'dart:developer';

import 'package:get/get.dart';

import '../../../Model/User.dart';
import '../View/home_page.dart';

class HomePageController extends GetxController {
  var userdata = Get.arguments;

  late User user;
  List<HomePageList> homePageLi = [];
  int index = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    homePageLi.add(HomePageList(
        heading: 'Bills', imageUrl: 'assets/home_page_bill_vector.png'));
    homePageLi.add(HomePageList(
        heading: 'GenerateBill',
        imageUrl: 'assets/home_page_generate_bill_vector.png'));
    homePageLi.add(HomePageList(
        heading: 'Logout', imageUrl: 'assets/home_page_logout_vector.png'));

    user = userdata;
    log(user.data.toString());
  }
}
