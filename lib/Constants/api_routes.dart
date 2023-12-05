class Api {
  static const String imageBaseUrl = 'http://192.168.100.7:8000/storage/';
  static const String baseUrl = 'http://192.168.100.7:8000/api/';

  // static const String imageBaseUrl = 'http://192.168.100.21:8000/storage/';
  // static const String baseUrl = 'http://192.168.100.21:8000/api/';

  static const String login = "${baseUrl}login";
  static const String fcmtokenrefresh = "${baseUrl}fcmtokenrefresh";
  static const String currentMonthBills =
      "${baseUrl}finance-manager/bills/current-month-bills/";
  static const String filterBills =
      "${baseUrl}finance-manager/bills/filter-bills/?";
  static const String search = "${baseUrl}finance-manager/bills/search";
  static const String generateHouseBill = "${baseUrl}generatehousebill";
  static const String generateSocietyApartmentBill =
      "${baseUrl}generatesocietyapartmentbill";
  static const String payBill = "${baseUrl}paybill";
}
