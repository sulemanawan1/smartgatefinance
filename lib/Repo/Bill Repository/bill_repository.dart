import 'dart:developer';

import 'package:smartgatefinance/Pages/Bill%20Page/Model/MonthlyBillModel.dart';
import 'package:smartgatefinance/Services/Network%20Services/network_services.dart';

import '../../Constants/api_routes.dart';

class BillRepository {
  final networkServices = NetworkServices();

  Future<MonthlyBillModel> currentMonthBillsApi(
      {required subAdminId,
      required bearerToken,
      required financeManagerId}) async {
    var response = await networkServices.getReq(
        "${Api.currentMonthBills}$subAdminId/$financeManagerId",
        bearerToken: bearerToken);
    log(response.toString());

    return MonthlyBillModel.fromJson(response);
  }

  Future<MonthlyBillModel> filterBillsApi(
      {required subAdminId,
      required bearerToken,
      required financeManagerId,
      String? startDate,
      String? endDate,
      String? paymentType,
      String? status}) async {
    if (status == "null" || status == null) {
      status = "";
    }

    if (paymentType == "null" || paymentType == null) {
      paymentType = "";
    }
    var response = await networkServices.getReq(
        "${Api.filterBills}subadminid=$subAdminId&financemanagerid=$financeManagerId&status=$status&paymenttype=$paymentType&startdate=$startDate&enddate=$endDate",
        bearerToken: bearerToken);
    log(response.toString());

    return MonthlyBillModel.fromJson(response);
  }

  Future<MonthlyBillModel> searchApi(
      {required data, required bearerToken}) async {
    var response = await networkServices.postFormReq(
      Api.search,
      data,
      bearerToken: bearerToken,
    );
    log(response.toString());

    return MonthlyBillModel.fromJson(response);
  }

  Future<String> generateHouseBillApi(
      {required data, required bearerToken}) async {
    var response = await networkServices.postFormReq(
      Api.generateHouseBill,
      data,
      bearerToken: bearerToken,
    );
    log(response.toString());
    log(response['message'].toString());

    return response['message'];
  }

  Future<String> generateSocietyApartmentBillApi(
      {required data, required bearerToken}) async {
    var response = await networkServices.postFormReq(
      Api.generateSocietyApartmentBill,
      data,
      bearerToken: bearerToken,
    );
    log(response.toString());
    log(response['message'].toString());

    return response['message'];
  }

  Future<String> payBillApi({required data, required bearerToken}) async {
    var response = await networkServices.postFormReq(
      Api.payBill,
      data,
      bearerToken: bearerToken,
    );
    log(response.toString());
    log(response['message'].toString());

    return response['message'];
  }
}
