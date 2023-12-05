import 'package:get/get.dart';
import 'package:smartgatefinance/Pages/Bill%20Page/Controller/bill_page_controller.dart';
import 'package:smartgatefinance/Pages/Home%20Page/Controller/home_page_controller.dart';
import 'package:smartgatefinance/Pages/House%20Bills/Controller/generate_house_bill_controller.dart';
import 'package:smartgatefinance/Pages/Login/controller/login_controller.dart';
import 'package:smartgatefinance/Pages/Splash/Controller/splash_controller.dart';

import '../Pages/Generate Bills/Controller/bills_controller.dart';
import '../Pages/Society Apartment Bills/Controller/generate_society_apartment_bills_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => BillPageController());
    Get.lazyPut(() => GenerateBillController());
    Get.lazyPut(() => GenerateSocietyApartmentBillsController());
    Get.lazyPut(() => GenerateHouseBillController());
  }
}
