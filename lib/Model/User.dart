/// success : true
/// data : {"id":114,"firstname":"Sigma","lastname":"Male","cnic":"0000","address":"Rawat Encalve","mobileno":"030007901355","roleid":6,"rolename":"financemanager","image":"images/user.png","fcmtoken":null,"created_at":"2023-06-04T13:37:01.000000Z","updated_at":"2023-06-04T13:37:01.000000Z","financemanagerid":124,"subadminid":2,"superadminid":1,"societyid":1,"status":"active"}
/// Bearer : "197|D8i1NuPO36lEzPSucVQmJrBojnQQBbrmbLzxOqKP"

class User {
  User({
    this.success,
    this.data,
    this.bearer,
  });

  User.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    bearer = json['Bearer'];
  }
  bool? success;
  Data? data;
  String? bearer;
  User copyWith({
    bool? success,
    Data? data,
    String? bearer,
  }) =>
      User(
        success: success ?? this.success,
        data: data ?? this.data,
        bearer: bearer ?? this.bearer,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['Bearer'] = bearer;
    return map;
  }
}

/// id : 114
/// firstname : "Sigma"
/// lastname : "Male"
/// cnic : "0000"
/// address : "Rawat Encalve"
/// mobileno : "030007901355"
/// roleid : 6
/// rolename : "financemanager"
/// image : "images/user.png"
/// fcmtoken : null
/// created_at : "2023-06-04T13:37:01.000000Z"
/// updated_at : "2023-06-04T13:37:01.000000Z"
/// financemanagerid : 124
/// subadminid : 2
/// superadminid : 1
/// societyid : 1
/// status : "active"

class Data {
  Data({
    this.id,
    this.firstname,
    this.lastname,
    this.cnic,
    this.address,
    this.mobileno,
    this.roleid,
    this.rolename,
    this.image,
    this.fcmtoken,
    this.createdAt,
    this.updatedAt,
    this.financemanagerid,
    this.subadminid,
    this.superadminid,
    this.societyid,
    this.status,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    cnic = json['cnic'];
    address = json['address'];
    mobileno = json['mobileno'];
    roleid = json['roleid'];
    rolename = json['rolename'];
    image = json['image'];
    fcmtoken = json['fcmtoken'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    financemanagerid = json['financemanagerid'];
    subadminid = json['subadminid'];
    superadminid = json['superadminid'];
    societyid = json['societyid'];
    status = json['status'];
  }
  int? id;
  String? firstname;
  String? lastname;
  String? cnic;
  String? address;
  String? mobileno;
  int? roleid;
  String? rolename;
  String? image;
  dynamic fcmtoken;
  String? createdAt;
  String? updatedAt;
  int? financemanagerid;
  int? subadminid;
  int? superadminid;
  int? societyid;
  String? status;
  Data copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? cnic,
    String? address,
    String? mobileno,
    int? roleid,
    String? rolename,
    String? image,
    dynamic fcmtoken,
    String? createdAt,
    String? updatedAt,
    int? financemanagerid,
    int? subadminid,
    int? superadminid,
    int? societyid,
    String? status,
  }) =>
      Data(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        cnic: cnic ?? this.cnic,
        address: address ?? this.address,
        mobileno: mobileno ?? this.mobileno,
        roleid: roleid ?? this.roleid,
        rolename: rolename ?? this.rolename,
        image: image ?? this.image,
        fcmtoken: fcmtoken ?? this.fcmtoken,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        financemanagerid: financemanagerid ?? this.financemanagerid,
        subadminid: subadminid ?? this.subadminid,
        superadminid: superadminid ?? this.superadminid,
        societyid: societyid ?? this.societyid,
        status: status ?? this.status,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['cnic'] = cnic;
    map['address'] = address;
    map['mobileno'] = mobileno;
    map['roleid'] = roleid;
    map['rolename'] = rolename;
    map['image'] = image;
    map['fcmtoken'] = fcmtoken;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['financemanagerid'] = financemanagerid;
    map['subadminid'] = subadminid;
    map['superadminid'] = superadminid;
    map['societyid'] = societyid;
    map['status'] = status;
    return map;
  }
}
