import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: CircularProgressIndicator(
          color: primaryColor,
        )),
      ],
    );
    ;
  }
}
