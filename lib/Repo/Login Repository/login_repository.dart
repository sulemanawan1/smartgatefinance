import 'package:smartgatefinance/Constants/api_routes.dart';
import 'package:smartgatefinance/Services/Network%20Services/network_services.dart';

class LoginRepository {
  final networkServices = NetworkServices();

  Future<dynamic> loginApi(data) async {
    var response = await networkServices.postFormReq(Api.login, data);
    return response;
  }
}
