import 'package:get/get.dart';

class GenerateBillController extends GetxController {
  List<GenerateBillCardData> list = [];

  @override
  void onInit() {
    // TODO: implement onInit
    list.add(GenerateBillCardData(
        text: 'House Bills', svgImageUrl: 'assets/houses.svg'));
    list.add(GenerateBillCardData(
        text: 'Apartment Bills', svgImageUrl: 'assets/apartments.svg'));
  }
}

class GenerateBillCardData {
  final String? text;
  final String? svgImageUrl;

  GenerateBillCardData({required this.text, required this.svgImageUrl});
}
