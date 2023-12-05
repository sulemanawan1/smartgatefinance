import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Data/Api Resp/api_response.dart';
import '../../../Repo/Bill Repository/bill_repository.dart';
import 'bill_page_controller.dart';

class BillPageSelectPaymentMethodController extends GetxController {
  List<String> paymentTypes = ['Cash', 'BankTransfer'];
  BillPageController billPageController = Get.find();
  bool loading = false;
  final billRepo = BillRepository();
  var responseStatus = Status.loading;
  String? paymentVal;
  setResponseStatus(Status val) {
    responseStatus = val;
    update();

    return responseStatus;
  }

  setPaymentVal({required value}) {
    paymentVal = value;
    update();
  }

  payBillApi(
      {required id,
      required paymentType,
      required bearerToken,
      required totalPaidAmount}) async {
    setResponseStatus(Status.loading);
    loading = true;
    update();
    Map<String, String> data = <String, String>{
      'id': id.toString(),
      'paymenttype': paymentType.toString(),
      "totalpaidamount": totalPaidAmount.toString()
    };
    billRepo.payBillApi(bearerToken: bearerToken, data: data).then((value) {
      loading = false;
      update();
      Get.snackbar('Success', value, backgroundColor: Colors.white);

      setResponseStatus(Status.completed);
    }).onError((error, stackTrace) {
      setResponseStatus(Status.error);
      loading = false;
      update();
      Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
      log(error.toString());
      log(stackTrace.toString());
    });
  }

  refreshUI() async {
    await billPageController.currentMonthBillsApi(
        subAdminId: billPageController.user.data!.subadminid!,
        bearerToken: billPageController.user.bearer,
        financeManagerId: billPageController.user.data!.id);

    update();
  }
}
