import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  formatDate1({required DateTime? date}) {
    String? formattedDate;
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    if (date != null) {
      formattedDate = dateFormat.format(date);
      return formattedDate;
    }
  }

  Future<String?> selectDate(BuildContext context) async {
    DateTime? date;
    String? formattedDate;

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: date ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      date = pickedDate;

      formattedDate = DateFormatter().formatDate1(date: date);

      return formattedDate;
    }
  }
}
