import 'package:flutter/material.dart';

class MyBillDivider extends StatelessWidget {
  const MyBillDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Divider(
        thickness: 1,
      ),
    );
  }
}
