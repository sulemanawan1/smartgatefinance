import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgatefinance/Constants/date_formatter.dart';
import 'package:smartgatefinance/Pages/Home%20Page/Controller/home_page_controller.dart';

import '../../../Data/Api Resp/api_response.dart';
import '../../../Repo/Bill Repository/bill_repository.dart';

class GenerateHouseBillController extends GetxController {
  HomePageController homePageController = Get.find();
  bool loading = false;
  final billRepo = BillRepository();
  var responseStatus = Status.loading;
  TextEditingController billStartDate = TextEditingController();
  TextEditingController billEndDate = TextEditingController();
  TextEditingController billDueDate = TextEditingController();
  setResponseStatus(Status val) {
    responseStatus = val;
    update();

    return responseStatus;
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    DateTime lastDayOfMonth =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    DateTime fifthDayOfMonth =
        DateTime(DateTime.now().year, DateTime.now().month, 5);
    DateTime dueDate = DateTime(2023, DateTime.now().month + 1, 15);
    billStartDate.text = DateFormatter().formatDate1(date: fifthDayOfMonth);
    billEndDate.text = DateFormatter().formatDate1(date: lastDayOfMonth);
    billDueDate.text = DateFormatter().formatDate1(date: dueDate);
  }

  generateHouseBillApi({
    required subAdminId,
    required financeManagerId,
    required dueDate,
    required billStartDate,
    required billEndDate,
    required bearerToken,
  }) {
    loading = true;
    update();
    Map<String, String> data = <String, String>{
      'subadminid': subAdminId.toString(),
      'financemanagerid': financeManagerId.toString(),
      'duedate': dueDate.toString(),
      'billstartdate': billStartDate.toString(),
      'billenddate': billEndDate.toString(),
      'status': "unpaid"
    };
    billRepo
        .generateHouseBillApi(bearerToken: bearerToken, data: data)
        .then((value) {
      loading = false;
      update();

      if (kDebugMode) {
        print(value);
        Get.snackbar('Message', value, backgroundColor: Colors.white);
        setResponseStatus(Status.completed);
      }
    }).onError((error, stackTrace) {
      loading = false;
      update();
      setResponseStatus(Status.error);
      Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
      log(error.toString());
      log(stackTrace.toString());
    });
  }
}
