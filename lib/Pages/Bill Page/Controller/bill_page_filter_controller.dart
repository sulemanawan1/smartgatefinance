import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgatefinance/Constants/date_formatter.dart';
import 'package:smartgatefinance/Pages/Bill%20Page/Controller/bill_page_controller.dart';

import '../../../Data/Api Resp/api_response.dart';
import '../../../Repo/Bill Repository/bill_repository.dart';

class BillPageFilterController extends GetxController {
  final billRepo = BillRepository();
  BillPageController billPageController = Get.find();

  String startDate = "";
  String? statusVal;
  String? paymentTypeValue;

  List<String> paymentTypes = ['Cash', 'BankTransfer', 'Online', 'NA'];

  List<String> statusTypes = ['paid', 'unpaid'];

  setPaymentTypeVal({required value}) {
    paymentTypeValue = value;
    update();
  }

  setStatusTypeVal({required value}) {
    statusVal = value;
    update();
  }

  selectDate(BuildContext context) async {
    startDate = await DateFormatter().selectDate(context) ?? "";
    update();
  }

  filterBillsApi({
    required subAdminId,
    required bearerToken,
    required financeManagerId,
    String? startDate,
    String? endDate,
    String? paymentType,
    String? status,
  }) {
    billPageController.li.clear();
    billPageController.setResponseStatus(Status.loading);

    update();

    billRepo
        .filterBillsApi(
            subAdminId: subAdminId,
            financeManagerId: financeManagerId,
            bearerToken: bearerToken,
            paymentType: paymentType,
            status: status,
            endDate: endDate,
            startDate: startDate)
        .then((value) {
      billPageController.setResponseStatus(Status.completed);

      for (int i = 0; i < value.data!.length; i++) {
        billPageController.li.add(value.data![i]);
      }
      Get.back();
    }).onError((error, stackTrace) {
      billPageController.setResponseStatus(Status.error);

      Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
      log(error.toString());
      log(stackTrace.toString());
    });
  }
}
