import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgatefinance/Data/Api%20Resp/api_response.dart';
import 'package:smartgatefinance/Pages/Bill%20Page/Model/MonthlyBillModel.dart';
import 'package:smartgatefinance/Repo/Bill%20Repository/bill_repository.dart';

import '../../../Model/User.dart' as users;

class BillPageController extends GetxController {
  final billRepo = BillRepository();
  var responseStatus = Status.loading;
  var userdata = Get.arguments;
  late users.User user;
  TextEditingController searchController = TextEditingController();
  List<String> dataColumnNames = [
    "Name",
    "MobileNo",
    "BillingMonth",
    "NoOfAppUsers",
    "PayAbleAmount",
    "Balance",
    "AppCharges",
    "Type",
    "Area",
    "StartDate",
    "EndDate",
    "DueDate",
    "Address",
    "PaymentType",
    "Status"
  ];
  late final MonthlyBillModel monthlyBillModel;
  List<Data> li = [];

  setResponseStatus(Status val) {
    responseStatus = val;
    update();

    return responseStatus;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user = userdata;
    currentMonthBillsApi(
        subAdminId: user.data!.subadminid!,
        bearerToken: user.bearer,
        financeManagerId: user.data!.id);
    log(user.data!.subadminid.toString());
    log(user.bearer.toString());
  }

  currentMonthBillsApi(
      {required subAdminId, required bearerToken, required financeManagerId}) {
    setResponseStatus(Status.loading);

    billRepo
        .currentMonthBillsApi(
            subAdminId: subAdminId,
            bearerToken: bearerToken,
            financeManagerId: financeManagerId)
        .then((value) {
      li.clear();
      update();

      for (int i = 0; i < value.data!.length; i++) {
        li.add(value.data![i]);
      }

      setResponseStatus(Status.completed);
    }).onError((error, stackTrace) {
      setResponseStatus(Status.error);

      Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
      log(error.toString());
      log(stackTrace.toString());
    });
  }

  searchApi(
      {required subAdminId,
      required search,
      required bearerToken,
      required financeManagerId}) async {
    setResponseStatus(Status.loading);

    Map<String, String> data = <String, String>{
      'subadminid': subAdminId.toString(),
      'search': search,
      "financemanagerid": financeManagerId.toString()
    };
    billRepo.searchApi(bearerToken: bearerToken, data: data).then((value) {
      update();
      if (kDebugMode) {
        print(value);

        li.clear();
        update();

        for (int i = 0; i < value.data!.length; i++) {
          li.add(value.data![i]);
        }
        setResponseStatus(Status.completed);
      }
    }).onError((error, stackTrace) {
      setResponseStatus(Status.error);

      Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
      log(error.toString());
      log(stackTrace.toString());
    });
  }

  String? searchQuery;
  Timer? debouncer;
  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
      update();
    }

    debouncer = Timer(duration, callback);
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debouncer?.cancel();
  }
}
