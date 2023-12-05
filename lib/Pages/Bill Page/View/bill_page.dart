import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartgatefinance/Constants/size_box.dart';
import 'package:smartgatefinance/Data/Api%20Resp/api_response.dart';
import 'package:smartgatefinance/Pages/Bill%20Page/Controller/bill_page_controller.dart';
import 'package:smartgatefinance/Widgets/Loader/loader.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/My App Bar/my_app_bar.dart';
import '../Controller/bill_page_filter_controller.dart';
import '../Controller/bill_page_select_payment_method_controller.dart';
import '../Widgets/build_data_column_status_card.dart';
import '../Widgets/build_data_column_text.dart';
import '../Widgets/build_data_row_text.dart';
import '../Widgets/custom_alert_dialog.dart';
import '../Widgets/payment_bill_widget.dart';
import '../Widgets/reusable_dropdown.dart';

class BillPage extends GetView {
  const BillPage({super.key});

  @override
  Widget build(BuildContext context) {
    log(
      "build",
    );
    return GetBuilder<BillPageController>(
        init: BillPageController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: whiteColor,
              appBar: const MyAppBar(title: 'Bills'),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 104.w),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        57.h.ph,
                        _heading(),
                        71.h.ph,
                        _buildSearchBarRow(controller, context),
                        57.h.ph,
                        if (controller.responseStatus == Status.loading)
                          Loader()
                        else if (controller.responseStatus == Status.completed)
                          _buildDataTable(controller, context)
                        else
                          const Text("SomeThing went Wrong")
                      ]),
                ),
              ));
        });
  }

  Container _buildDataTable(
      BillPageController controller, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            color: HexColor(
              '#F3F3F3',
            )),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columnSpacing: 40,
                columns: controller.dataColumnNames
                    .map((e) => _dataColumns(name: e.toString()))
                    .toList(),
                rows: [
                  for (int i = 0; i < controller.li.length; i++) ...[
                    _dataRows(
                        id: controller.li[i].id.toString(),
                        name:
                            '${controller.li[i].user!.first.firstname.toString()} ${controller.li[i].user!.first.lastname.toString()}',
                        mobileNo:
                            controller.li[i].user!.first.mobileno.toString(),
                        billingMonth: controller.li[i].month.toString(),
                        noOfAppUsers: controller.li[i].noofappusers.toString(),
                        payAbleAmount:
                            controller.li[i].payableamount.toString(),
                        balance: controller.li[i].balance.toString(),
                        appCharges: controller.li[i].appcharges.toString(),
                        type: controller.li[i].billtype.toString(),
                        area:
                            controller.li[i].measurement!.first.area.toString(),
                        startDate: controller.li[i].billstartdate.toString(),
                        endDate: controller.li[i].billenddate.toString(),
                        dueDate: controller.li[i].duedate.toString(),
                        address:
                            controller.li[i].user!.first.address.toString(),
                        paymentType: controller.li[i].paymenttype.toString(),
                        status: controller.li[i].status,
                        context: context,
                        index: i),
                  ]
                ])));
  }

  Row _buildSearchBarRow(BillPageController controller, BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: TextField(
            style: GoogleFonts.inder(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: HexColor('#000000')),
            controller: controller.searchController,
            onChanged: (value) => controller.debounce(
              () async {
                controller.searchQuery = value.toString();

                controller.searchApi(
                    subAdminId: controller.user.data!.subadminid,
                    search: controller.searchQuery,
                    bearerToken: controller.user.bearer,
                    financeManagerId: controller.user.data!.id);
              },
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
              filled: true,
              //<-- SEE HERE
              fillColor: HexColor("#F7F8FA"),

              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Search',
              hintStyle: GoogleFonts.inder(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: HexColor('#ACACAC')),
              suffixIcon: InkWell(
                child: const Icon(Icons.cancel),
                onTap: () {
                  controller.searchController.text = '';
                  controller.currentMonthBillsApi(
                      financeManagerId: controller.user.data!.id,
                      subAdminId: controller.user.data!.subadminid,
                      bearerToken: controller.user.bearer.toString());
                },
              ),
              prefixIcon: const Icon(
                Icons.search,
              ),
              suffixIconColor: HexColor('#AFAFAF'),
              prefixIconColor: HexColor('#AFAFAF'),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return _filterDialog(context);
                      });
                },
                child: SvgPicture.asset(
                  'assets/bill_page_filter.svg',
                  color: HexColor('#AFAFAF'),
                ))),
        IconButton(
          iconSize: 30,
          tooltip: 'Resfresh',
          icon: const Icon(
            Icons.refresh,
            color: Colors.green,
          ),
          onPressed: () {
            controller.searchController.clear();
            controller.currentMonthBillsApi(
                financeManagerId: controller.user.data!.id,
                subAdminId: controller.user.data!.subadminid,
                bearerToken: controller.user.bearer.toString());
          },
        )
      ],
    );
  }

  GetBuilder<BillPageFilterController> _filterDialog(BuildContext context) {
    return GetBuilder<BillPageFilterController>(
        init: BillPageFilterController(),
        builder: (controller) {
          return CustomAlertDialog(
            context: context,
            icon: Icons.filter_list_outlined,
            positiveButtonColor: primaryColor,
            titleText: 'Filters',
            positiveButtonText: 'Filters',
            negativeButtonText: 'Clear',
            onTapNegative: () {
              controller.billPageController.currentMonthBillsApi(
                  financeManagerId: controller.billPageController.user.data!.id,
                  subAdminId:
                      controller.billPageController.user.data!.subadminid,
                  bearerToken:
                      controller.billPageController.user.bearer.toString());
              Get.back();
            },
            onTapPositive: () async {
              log(controller.startDate.toString());
              log(controller.statusVal.toString());
              log(controller.paymentTypeValue.toString());
              log(controller.billPageController.user.bearer.toString());
              log(controller.billPageController.user.data!.subadminid
                  .toString());

              if (controller.startDate == "" &&
                  controller.statusVal == null &&
                  controller.paymentTypeValue == null) {
                controller.billPageController.currentMonthBillsApi(
                    financeManagerId:
                        controller.billPageController.user.data!.id,
                    subAdminId:
                        controller.billPageController.user.data!.subadminid,
                    bearerToken:
                        controller.billPageController.user.bearer.toString());
                Get.back();
              } else {
                controller.filterBillsApi(
                    bearerToken:
                        controller.billPageController.user.bearer.toString(),
                    subAdminId: controller
                        .billPageController.user.data!.subadminid
                        .toString(),
                    financeManagerId:
                        controller.billPageController.user.data!.id,
                    startDate: controller.startDate.toString(),
                    endDate: controller.startDate.toString(),
                    status: controller.statusVal.toString(),
                    paymentType: controller.paymentTypeValue.toString());
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Start Date',
                          style: GoogleFonts.montserrat(
                              color: primaryColor,
                              fontSize: 14.sp,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          controller.startDate.toString() ??
                              'Select Start Date',
                          style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                        ),
                        onTap: () => controller.selectDate(context),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'End Date',
                          style: GoogleFonts.montserrat(
                              color: primaryColor,
                              fontSize: 14.sp,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          controller.startDate?.toString() ?? 'Select End Date',
                          style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                        ),
                        onTap: () => controller.selectDate(context),
                      ),
                    ),
                  ],
                ),
                20.h.ph,
                Text(
                  "PaymentType",
                  style: GoogleFonts.montserrat(
                      color: primaryColor,
                      fontSize: 14.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                ),
                10.h.ph,
                ReusableDropdown(
                  value: controller.paymentTypeValue,
                  items: controller.paymentTypes,
                  onChanged: (value) {
                    controller.setPaymentTypeVal(value: value);
                  },
                  hint: "Select Payment Method",
                ),
                20.h.ph,
                Text(
                  "StatusType",
                  style: GoogleFonts.montserrat(
                      color: primaryColor,
                      fontSize: 14.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                ),
                10.h.ph,
                ReusableDropdown(
                    value: controller.statusVal,
                    items: controller.statusTypes,
                    onChanged: (value) {
                      controller.setStatusTypeVal(value: value);
                    },
                    hint: 'Select Status Type')
              ],
            ),
          );
        });
  }

  Text _heading() {
    return Text(
      "Apartment / House Residents Bills",
      style: GoogleFonts.montserrat(
          color: secondaryColor,
          fontSize: 40.sp,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600),
    );
  }

  DataColumn _dataColumns({
    required name,
  }) {
    return DataColumn(
      label: BuildDataColumnText(text: name),
    );
  }

  DataRow _dataRows(
      {required name,
      required mobileNo,
      required billingMonth,
      required noOfAppUsers,
      required payAbleAmount,
      required balance,
      required appCharges,
      required type,
      required area,
      required startDate,
      required endDate,
      required dueDate,
      required address,
      required paymentType,
      required status,
      required BuildContext context,
      required index,
      required id}) {
    return DataRow(
      color: MaterialStateProperty.resolveWith(
          (states) => index % 2 == 0 ? HexColor('#FDFDFD') : null),
      cells: <DataCell>[
        DataCell(BuildDataRowText(text: name ?? "")),
        DataCell(BuildDataRowText(text: mobileNo ?? "")),
        DataCell(BuildDataRowText(text: billingMonth ?? "")),
        DataCell(BuildDataRowText(text: noOfAppUsers ?? "")),
        DataCell(BuildDataRowText(text: payAbleAmount ?? "")),
        DataCell(BuildDataRowText(text: balance ?? "")),
        DataCell(BuildDataRowText(text: appCharges ?? "")),
        DataCell(BuildDataRowText(text: type ?? "")),
        DataCell(BuildDataRowText(text: area ?? "")),
        DataCell(BuildDataRowText(text: startDate ?? "")),
        DataCell(BuildDataRowText(text: endDate ?? "")),
        DataCell(BuildDataRowText(text: dueDate ?? "")),
        DataCell(BuildDataRowText(text: address ?? "")),
        DataCell(BuildDataRowText(text: paymentType ?? "")),
        if (status == 'unpaid')
          DataCell(
              const BuildDataColumnStatusCard(
                  text: "Unpaid", color: Colors.orange), onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return _paymentDialog(
                    id: id,
                    context: context,
                    dueDate: dueDate,
                    appCharges: appCharges,
                    balance: balance,
                    payAbleAmount: payAbleAmount,
                    noOfAppUsers: noOfAppUsers,
                    month: billingMonth,
                  );
                });
          })
        else if (status == 'paid')
          const DataCell(
              BuildDataColumnStatusCard(text: "Paid", color: Colors.green)),
      ],
    );
  }

  CustomAlertDialog _paymentDialog({
    required BuildContext context,
    required id,
    required dueDate,
    required appCharges,
    required balance,
    required payAbleAmount,
    required month,
    required noOfAppUsers,
  }) {
    return CustomAlertDialog(
      titleText: 'Payment',
      icon: Icons.payments,
      positiveButtonText: 'Proceed',
      context: context,
      onTapPositive: () {
        showDialog(
            context: context,
            builder: (context) {
              return _selectPaymentMethodDialog(
                  context: context, id: id, payAbleAmount: payAbleAmount);
            });
      },
      child: PaymentBillWidget(
        dueDate: dueDate,
        appCharges: appCharges,
        balance: balance,
        payAbleAmount: payAbleAmount,
        month: month,
        noOfAppUsers: noOfAppUsers,
      ),
    );
  }

  Widget _selectPaymentMethodDialog(
      {required BuildContext context, required id, required payAbleAmount}) {
    return GetBuilder<BillPageSelectPaymentMethodController>(
        init: BillPageSelectPaymentMethodController(),
        builder: (controller) {
          return CustomAlertDialog(
              context: context,
              icon: Icons.payments,
              titleText: 'Select Payment Method',
              loading: controller.loading,
              onTapPositive: () {
                if (controller.paymentVal != null) {
                  if (!controller.loading) {
                    log(id.toString());
                    log(controller.paymentVal.toString());
                    log(payAbleAmount);
                    controller.payBillApi(
                        id: id.toString(),
                        paymentType: controller.paymentVal.toString(),
                        bearerToken: controller.billPageController.user.bearer,
                        totalPaidAmount: payAbleAmount);

                    controller.refreshUI();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                } else {
                  Get.snackbar('Error', 'please Select Payment Method',
                      colorText: Colors.redAccent,
                      backgroundColor: Colors.white);
                }
              },
              child: Column(
                children: [
                  ReusableDropdown(
                    value: controller.paymentVal,
                    items: controller.paymentTypes,
                    onChanged: (value) {
                      controller.setPaymentVal(value: value);
                    },
                    hint: "Select Payment Method",
                  ),
                ],
              ));
        });
  }
}
