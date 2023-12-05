import 'package:flutter/cupertino.dart';

import 'my_bill_divider.dart';
import 'my_bill_widget.dart';

class PaymentBillWidget extends StatelessWidget {
  final String appCharges;
  final String noOfAppUsers;
  final String balance;
  final String payAbleAmount;
  final String month;
  final String dueDate;

  const PaymentBillWidget(
      {super.key,
      required this.appCharges,
      required this.noOfAppUsers,
      required this.balance,
      required this.payAbleAmount,
      required this.month,
      required this.dueDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyBillWidget(name: 'App Charges', description: appCharges),
        const MyBillDivider(),
        MyBillWidget(name: 'No of App Users', description: noOfAppUsers),
        MyBillWidget(name: 'Balance', description: balance),
        const MyBillDivider(),
        MyBillWidget(name: 'Payable Amount ', description: payAbleAmount),
        const MyBillDivider(),
        MyBillWidget(name: 'Billing Month', description: month),
        MyBillWidget(name: 'DueDate', description: dueDate),
        const MyBillDivider()
      ],
    );
  }
}
