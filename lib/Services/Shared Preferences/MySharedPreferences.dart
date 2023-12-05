import 'package:shared_preferences/shared_preferences.dart';

import '../../Constants/shared_preferences_constants.dart';
import '../../Model/User.dart';

deleteUserData() async {
  User _user = User();

  await SharedPreferences.getInstance().then((value) {
    // value.remove(userIdSPKey);
    // value.remove(firstNameSPKey);
    // value.remove(lastNameSPKey);
    final success = value.remove(bearerTokenSPKey);
    print(success.then((value) => value));
    // value.remove(cnicSPKey);
    // value.remove(roleNameSPKey);
    // value.remove(roleIdSPKey);
  });
}

class MySharedPreferences {
  static deleteUserData() async {
    User _user = User();

    await SharedPreferences.getInstance().then((value) {
      // value.remove(userIdSPKey);
      // value.remove(firstNameSPKey);
      // value.remove(lastNameSPKey);
      final success = value.remove(bearerTokenSPKey);

      print(success.then((value) => value));
      value.remove(cnicSPKey);
      value.remove(roleNameSPKey);
      value.remove(roleIdSPKey);
      value.remove(subAdminIdSPKey);
      value.remove(superAdminIdSPKey);
      value.remove(userIdSPKey);
      value.remove(firstNameSPKey);
      value.remove(lastNameSPKey);
      value.remove(cnicSPKey);
      value.remove(bearerTokenSPKey);
    });
  }

  static setUserData({required User user}) async {
    await SharedPreferences.getInstance().then((value) {
      value.setInt(userIdSPKey, user.data!.financemanagerid ?? 0);
      value.setInt(subAdminIdSPKey, user.data!.subadminid ?? 0);
      value.setInt(societyIdSPKey, user.data!.societyid ?? 0);
      value.setInt(superAdminIdSPKey, user.data!.superadminid ?? 0);
      value.setString(firstNameSPKey, user.data!.firstname ?? '');
      value.setString(lastNameSPKey, user.data!.lastname ?? '');
      value.setString(bearerTokenSPKey, user.bearer ?? '');
      value.setString(cnicSPKey, user.data!.cnic ?? '');
      value.setString(roleNameSPKey, user.data!.rolename ?? '');
      value.setInt(roleIdSPKey, user.data!.roleid ?? 0);
    });
  }

  static Future<User> getUserData() async {
    var _user = User();
    await SharedPreferences.getInstance().then((value) {
      value.getInt(userIdSPKey) ?? value.setInt(userIdSPKey, 0);
      value.getInt(superAdminIdSPKey) ?? value.setInt(superAdminIdSPKey, 0);
      value.getInt(subAdminIdSPKey) ?? value.setInt(subAdminIdSPKey, 0);
      value.getInt(societyIdSPKey) ?? value.setInt(societyIdSPKey, 0);
      value.getString(firstNameSPKey) ?? value.setString(firstNameSPKey, '');
      value.getString(lastNameSPKey) ?? value.setString(lastNameSPKey, '');
      value.getString(bearerTokenSPKey) ??
          value.setString(bearerTokenSPKey, '');
      value.getString(cnicSPKey) ?? value.setString(cnicSPKey, '');
      value.getString(roleNameSPKey) ?? value.setString(roleNameSPKey, '');
      value.getInt(roleIdSPKey) ?? value.setInt(roleIdSPKey, 0);

      _user = User(
          data: Data(
              id: value.getInt(userIdSPKey),
              firstname: value.getString(firstNameSPKey),
              lastname: value.getString(lastNameSPKey),
              cnic: value.getString(cnicSPKey),
              roleid: value.getInt(roleIdSPKey),
              superadminid: value.getInt(superAdminIdSPKey),
              societyid: value.getInt(societyIdSPKey),
              subadminid: value.getInt(subAdminIdSPKey),
              rolename: value.getString(roleNameSPKey)),
          bearer: value.getString(bearerTokenSPKey));
    });
    return _user;
  }
}
