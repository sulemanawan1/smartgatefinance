import 'package:get/get.dart';
import 'package:smartgatefinance/Pages/Bill%20Page/View/bill_page.dart';
import 'package:smartgatefinance/Pages/Generate%20Bills/View/generate_bills.dart';
import 'package:smartgatefinance/Pages/Home%20Page/View/home_page.dart';
import 'package:smartgatefinance/Pages/House%20Bills/View/generate_house_bill.dart';
import 'package:smartgatefinance/Pages/Login/View/login.dart';
import 'package:smartgatefinance/Pages/Society%20Apartment%20Bills/View/generate_society_apartment_bills.dart';
import 'package:smartgatefinance/Pages/Splash/View/splash_screen.dart';
import 'package:smartgatefinance/Routes/screen_binding.dart';
import 'package:smartgatefinance/Routes/set_routes.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: splash,
        page: () => const SplashPage(),
        binding: ScreenBindings(),
      ),
      GetPage(
          name: login,
          page: () => const LogIn(),
          binding: ScreenBindings(),
          transition: Transition.fade,
          transitionDuration: const Duration(seconds: 1)),
      GetPage(
          name: homePage,
          page: () => const HomePage(),
          binding: ScreenBindings(),
          transition: Transition.fade,
          transitionDuration: const Duration(seconds: 1)),
      GetPage(
          name: billPage,
          page: () => const BillPage(),
          binding: ScreenBindings(),
          transition: Transition.fade,
          transitionDuration: const Duration(seconds: 1)),
      GetPage(
          name: generateBillPage,
          page: () => const GenerateBills(),
          binding: ScreenBindings(),
          transition: Transition.fade,
          transitionDuration: const Duration(seconds: 1)),
      GetPage(
          name: generateHouseBillPage,
          page: () => GenerateHouseBill(),
          binding: ScreenBindings(),
          transition: Transition.fade,
          transitionDuration: const Duration(seconds: 1)),
      GetPage(
          name: generateSocietyApartmentBillsPage,
          page: () => GenerateSocietyApartmentBills(),
          binding: ScreenBindings(),
          transition: Transition.fade,
          transitionDuration: const Duration(seconds: 1)),
    ];
  }
}
