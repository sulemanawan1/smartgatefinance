/// success : true
/// data : [{"id":3,"charges":"5000.00","chargesafterduedate":"6100.00","appcharges":"100.00","tax":"750.00","balance":"5850.00","payableamount":"5850.00","subadminid":2,"residentid":4,"propertyid":1,"measurementid":1,"duedate":"2023-04-29","billstartdate":"2023-04-28","billenddate":"2023-04-29","month":"April 2023","status":0,"noofappusers":1,"created_at":"2023-04-28T14:51:35.000000Z","updated_at":"2023-04-28T14:51:35.000000Z","user":[{"id":4,"firstname":"Umer","lastname":"Bashir","cnic":"1","address":"Rawat Enclave,Block#1,Street#1,House#1","mobileno":"0300","password":"$2y$10$Y672rdtIgtV2..GAlFheb.yqFv4FcdlCGAvdz2lvSD0vTnkfMjZxi","roleid":3,"rolename":"resident","image":"images/user.png","fcmtoken":"d2sFJLkXSeiS0jdh2nzlAD:APA91bHVNWN4Do2KozEFBt-g-9MTC1EJEBeFKxGx_xbhCj6ds25G6Z2EczQLRuHDX08uJFkf_A4hzrqEYKjIXaBM2slYoLkf4Pep-6f04VXDye9DUbfj5xV-SIJ1Nxw_e2AW7AOXPLSx","created_at":"2023-04-28T12:42:54.000000Z","updated_at":"2023-04-28T14:46:02.000000Z"}],"resident":[{"id":1,"residentid":4,"subadminid":2,"country":"🇵🇰    Pakistan","state":"null","city":"null","houseaddress":"Rawat Enclave,Block#1,Street#1,House#1","vechileno":"","residenttype":"Owner","propertytype":"house","committeemember":0,"status":1,"created_at":"2023-04-28T12:43:42.000000Z","updated_at":"2023-04-28T14:44:23.000000Z"}],"measurement":[{"id":1,"subadminid":2,"type":"house","unit":"marla","charges":"5000.00","chargesafterduedate":"5250.00","appcharges":"100.00","tax":"750.00","area":"5.00","bedrooms":5,"status":0,"created_at":"2023-04-28T12:38:11.000000Z","updated_at":"2023-04-28T12:38:11.000000Z"}],"property":[{"id":1,"address":"House#1","type":"street","iteration":"1","dynamicid":1,"subadminid":2,"societyid":1,"superadminid":1,"occupied":1,"created_at":"2023-04-28T12:37:18.000000Z","updated_at":"2023-04-28T14:44:23.000000Z"}]},{"id":4,"charges":"7000.00","chargesafterduedate":"8540.00","appcharges":"140.00","tax":"1050.00","balance":"8190.00","payableamount":"8190.00","subadminid":2,"residentid":5,"propertyid":2,"measurementid":2,"duedate":"2023-04-29","billstartdate":"2023-04-28","billenddate":"2023-04-29","month":"April 2023","status":0,"noofappusers":1,"created_at":"2023-04-28T14:51:35.000000Z","updated_at":"2023-04-28T14:51:35.000000Z","user":[{"id":5,"firstname":"Farrah","lastname":"Bashir","cnic":"111","address":"Rawat Enclave,Block#1,Street#1,House#2","mobileno":"0321555079","password":"$2y$10$EkwjSnFweqBp5ZR5oisY3.tsWn9RHeWAuhDI.inX4dHvyZrOIs43K","roleid":3,"rolename":"resident","image":"images/user.png","fcmtoken":"doicq4q0TNyYXYxTFmd9y1:APA91bG-j6VAHLt8zKZLyrhvW_tmMpSNf5qmFdGPCyz_kqQJRmHfMxv17CZ-DRUTi6oj-DgjicRvq9Hfkp-DkZ6JMXMySE9ZmcUWqL9vK_juzk75QXLO_JpEJpnGbxOxg0G3rTNAL6IH","created_at":"2023-04-28T12:47:00.000000Z","updated_at":"2023-04-28T14:44:19.000000Z"}],"resident":[{"id":2,"residentid":5,"subadminid":2,"country":"🇵🇰    Pakistan","state":"Punjab","city":"Rawalpindi","houseaddress":"Rawat Enclave,Block#1,Street#1,House#2","vechileno":"rwp66","residenttype":"Rental","propertytype":"house","committeemember":0,"status":1,"created_at":"2023-04-28T12:47:52.000000Z","updated_at":"2023-04-28T14:44:19.000000Z"}],"measurement":[{"id":2,"subadminid":2,"type":"house","unit":"marla","charges":"7000.00","chargesafterduedate":"7350.00","appcharges":"140.00","tax":"1050.00","area":"7.00","bedrooms":7,"status":0,"created_at":"2023-04-28T12:38:45.000000Z","updated_at":"2023-04-28T12:38:45.000000Z"}],"property":[{"id":2,"address":"House#2","type":"street","iteration":"2","dynamicid":1,"subadminid":2,"societyid":1,"superadminid":1,"occupied":1,"created_at":"2023-04-28T12:37:18.000000Z","updated_at":"2023-04-28T14:44:19.000000Z"}]}]

class BillModel {
  BillModel({
      this.success, 
      this.data,});

  BillModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? success;
  List<Data>? data;
BillModel copyWith({  bool? success,
  List<Data>? data,
}) => BillModel(  success: success ?? this.success,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// charges : "5000.00"
/// chargesafterduedate : "6100.00"
/// appcharges : "100.00"
/// tax : "750.00"
/// balance : "5850.00"
/// payableamount : "5850.00"
/// subadminid : 2
/// residentid : 4
/// propertyid : 1
/// measurementid : 1
/// duedate : "2023-04-29"
/// billstartdate : "2023-04-28"
/// billenddate : "2023-04-29"
/// month : "April 2023"
/// status : 0
/// noofappusers : 1
/// created_at : "2023-04-28T14:51:35.000000Z"
/// updated_at : "2023-04-28T14:51:35.000000Z"
/// user : [{"id":4,"firstname":"Umer","lastname":"Bashir","cnic":"1","address":"Rawat Enclave,Block#1,Street#1,House#1","mobileno":"0300","password":"$2y$10$Y672rdtIgtV2..GAlFheb.yqFv4FcdlCGAvdz2lvSD0vTnkfMjZxi","roleid":3,"rolename":"resident","image":"images/user.png","fcmtoken":"d2sFJLkXSeiS0jdh2nzlAD:APA91bHVNWN4Do2KozEFBt-g-9MTC1EJEBeFKxGx_xbhCj6ds25G6Z2EczQLRuHDX08uJFkf_A4hzrqEYKjIXaBM2slYoLkf4Pep-6f04VXDye9DUbfj5xV-SIJ1Nxw_e2AW7AOXPLSx","created_at":"2023-04-28T12:42:54.000000Z","updated_at":"2023-04-28T14:46:02.000000Z"}]
/// resident : [{"id":1,"residentid":4,"subadminid":2,"country":"🇵🇰    Pakistan","state":"null","city":"null","houseaddress":"Rawat Enclave,Block#1,Street#1,House#1","vechileno":"","residenttype":"Owner","propertytype":"house","committeemember":0,"status":1,"created_at":"2023-04-28T12:43:42.000000Z","updated_at":"2023-04-28T14:44:23.000000Z"}]
/// measurement : [{"id":1,"subadminid":2,"type":"house","unit":"marla","charges":"5000.00","chargesafterduedate":"5250.00","appcharges":"100.00","tax":"750.00","area":"5.00","bedrooms":5,"status":0,"created_at":"2023-04-28T12:38:11.000000Z","updated_at":"2023-04-28T12:38:11.000000Z"}]
/// property : [{"id":1,"address":"House#1","type":"street","iteration":"1","dynamicid":1,"subadminid":2,"societyid":1,"superadminid":1,"occupied":1,"created_at":"2023-04-28T12:37:18.000000Z","updated_at":"2023-04-28T14:44:23.000000Z"}]

class Data {
  Data({
      this.id, 
      this.charges, 
      this.chargesafterduedate, 
      this.appcharges, 
      this.tax, 
      this.balance, 
      this.payableamount, 
      this.subadminid, 
      this.residentid, 
      this.propertyid, 
      this.measurementid, 
      this.duedate, 
      this.billstartdate, 
      this.billenddate, 
      this.month, 
      this.status, 
      this.noofappusers, 
      this.createdAt, 
      this.updatedAt, 
      this.user, 
      this.resident, 
      this.measurement, 
      this.property,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    charges = json['charges'];
    chargesafterduedate = json['chargesafterduedate'];
    appcharges = json['appcharges'];
    tax = json['tax'];
    balance = json['balance'];
    payableamount = json['payableamount'];
    subadminid = json['subadminid'];
    residentid = json['residentid'];
    propertyid = json['propertyid'];
    measurementid = json['measurementid'];
    duedate = json['duedate'];
    billstartdate = json['billstartdate'];
    billenddate = json['billenddate'];
    month = json['month'];
    status = json['status'];
    noofappusers = json['noofappusers'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['user'] != null) {
      user = [];
      json['user'].forEach((v) {
        user?.add(User.fromJson(v));
      });
    }
    if (json['resident'] != null) {
      resident = [];
      json['resident'].forEach((v) {
        resident?.add(Resident.fromJson(v));
      });
    }
    if (json['measurement'] != null) {
      measurement = [];
      json['measurement'].forEach((v) {
        measurement?.add(Measurement.fromJson(v));
      });
    }
    if (json['property'] != null) {
      property = [];
      json['property'].forEach((v) {
        property?.add(Property.fromJson(v));
      });
    }
  }
  int? id;
  String? charges;
  String? chargesafterduedate;
  String? appcharges;
  String? tax;
  String? balance;
  String? payableamount;
  int? subadminid;
  int? residentid;
  int? propertyid;
  int? measurementid;
  String? duedate;
  String? billstartdate;
  String? billenddate;
  String? month;
  int? status;
  int? noofappusers;
  String? createdAt;
  String? updatedAt;
  List<User>? user;
  List<Resident>? resident;
  List<Measurement>? measurement;
  List<Property>? property;
Data copyWith({  int? id,
  String? charges,
  String? chargesafterduedate,
  String? appcharges,
  String? tax,
  String? balance,
  String? payableamount,
  int? subadminid,
  int? residentid,
  int? propertyid,
  int? measurementid,
  String? duedate,
  String? billstartdate,
  String? billenddate,
  String? month,
  int? status,
  int? noofappusers,
  String? createdAt,
  String? updatedAt,
  List<User>? user,
  List<Resident>? resident,
  List<Measurement>? measurement,
  List<Property>? property,
}) => Data(  id: id ?? this.id,
  charges: charges ?? this.charges,
  chargesafterduedate: chargesafterduedate ?? this.chargesafterduedate,
  appcharges: appcharges ?? this.appcharges,
  tax: tax ?? this.tax,
  balance: balance ?? this.balance,
  payableamount: payableamount ?? this.payableamount,
  subadminid: subadminid ?? this.subadminid,
  residentid: residentid ?? this.residentid,
  propertyid: propertyid ?? this.propertyid,
  measurementid: measurementid ?? this.measurementid,
  duedate: duedate ?? this.duedate,
  billstartdate: billstartdate ?? this.billstartdate,
  billenddate: billenddate ?? this.billenddate,
  month: month ?? this.month,
  status: status ?? this.status,
  noofappusers: noofappusers ?? this.noofappusers,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  user: user ?? this.user,
  resident: resident ?? this.resident,
  measurement: measurement ?? this.measurement,
  property: property ?? this.property,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['charges'] = charges;
    map['chargesafterduedate'] = chargesafterduedate;
    map['appcharges'] = appcharges;
    map['tax'] = tax;
    map['balance'] = balance;
    map['payableamount'] = payableamount;
    map['subadminid'] = subadminid;
    map['residentid'] = residentid;
    map['propertyid'] = propertyid;
    map['measurementid'] = measurementid;
    map['duedate'] = duedate;
    map['billstartdate'] = billstartdate;
    map['billenddate'] = billenddate;
    map['month'] = month;
    map['status'] = status;
    map['noofappusers'] = noofappusers;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user?.map((v) => v.toJson()).toList();
    }
    if (resident != null) {
      map['resident'] = resident?.map((v) => v.toJson()).toList();
    }
    if (measurement != null) {
      map['measurement'] = measurement?.map((v) => v.toJson()).toList();
    }
    if (property != null) {
      map['property'] = property?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// address : "House#1"
/// type : "street"
/// iteration : "1"
/// dynamicid : 1
/// subadminid : 2
/// societyid : 1
/// superadminid : 1
/// occupied : 1
/// created_at : "2023-04-28T12:37:18.000000Z"
/// updated_at : "2023-04-28T14:44:23.000000Z"

class Property {
  Property({
      this.id, 
      this.address, 
      this.type, 
      this.iteration, 
      this.dynamicid, 
      this.subadminid, 
      this.societyid, 
      this.superadminid, 
      this.occupied, 
      this.createdAt, 
      this.updatedAt,});

  Property.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    type = json['type'];
    iteration = json['iteration'];
    dynamicid = json['dynamicid'];
    subadminid = json['subadminid'];
    societyid = json['societyid'];
    superadminid = json['superadminid'];
    occupied = json['occupied'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? address;
  String? type;
  String? iteration;
  int? dynamicid;
  int? subadminid;
  int? societyid;
  int? superadminid;
  int? occupied;
  String? createdAt;
  String? updatedAt;
Property copyWith({  int? id,
  String? address,
  String? type,
  String? iteration,
  int? dynamicid,
  int? subadminid,
  int? societyid,
  int? superadminid,
  int? occupied,
  String? createdAt,
  String? updatedAt,
}) => Property(  id: id ?? this.id,
  address: address ?? this.address,
  type: type ?? this.type,
  iteration: iteration ?? this.iteration,
  dynamicid: dynamicid ?? this.dynamicid,
  subadminid: subadminid ?? this.subadminid,
  societyid: societyid ?? this.societyid,
  superadminid: superadminid ?? this.superadminid,
  occupied: occupied ?? this.occupied,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['type'] = type;
    map['iteration'] = iteration;
    map['dynamicid'] = dynamicid;
    map['subadminid'] = subadminid;
    map['societyid'] = societyid;
    map['superadminid'] = superadminid;
    map['occupied'] = occupied;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 1
/// subadminid : 2
/// type : "house"
/// unit : "marla"
/// charges : "5000.00"
/// chargesafterduedate : "5250.00"
/// appcharges : "100.00"
/// tax : "750.00"
/// area : "5.00"
/// bedrooms : 5
/// status : 0
/// created_at : "2023-04-28T12:38:11.000000Z"
/// updated_at : "2023-04-28T12:38:11.000000Z"

class Measurement {
  Measurement({
      this.id, 
      this.subadminid, 
      this.type, 
      this.unit, 
      this.charges, 
      this.chargesafterduedate, 
      this.appcharges, 
      this.tax, 
      this.area, 
      this.bedrooms, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Measurement.fromJson(dynamic json) {
    id = json['id'];
    subadminid = json['subadminid'];
    type = json['type'];
    unit = json['unit'];
    charges = json['charges'];
    chargesafterduedate = json['chargesafterduedate'];
    appcharges = json['appcharges'];
    tax = json['tax'];
    area = json['area'];
    bedrooms = json['bedrooms'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? subadminid;
  String? type;
  String? unit;
  String? charges;
  String? chargesafterduedate;
  String? appcharges;
  String? tax;
  String? area;
  int? bedrooms;
  int? status;
  String? createdAt;
  String? updatedAt;
Measurement copyWith({  int? id,
  int? subadminid,
  String? type,
  String? unit,
  String? charges,
  String? chargesafterduedate,
  String? appcharges,
  String? tax,
  String? area,
  int? bedrooms,
  int? status,
  String? createdAt,
  String? updatedAt,
}) => Measurement(  id: id ?? this.id,
  subadminid: subadminid ?? this.subadminid,
  type: type ?? this.type,
  unit: unit ?? this.unit,
  charges: charges ?? this.charges,
  chargesafterduedate: chargesafterduedate ?? this.chargesafterduedate,
  appcharges: appcharges ?? this.appcharges,
  tax: tax ?? this.tax,
  area: area ?? this.area,
  bedrooms: bedrooms ?? this.bedrooms,
  status: status ?? this.status,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['subadminid'] = subadminid;
    map['type'] = type;
    map['unit'] = unit;
    map['charges'] = charges;
    map['chargesafterduedate'] = chargesafterduedate;
    map['appcharges'] = appcharges;
    map['tax'] = tax;
    map['area'] = area;
    map['bedrooms'] = bedrooms;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 1
/// residentid : 4
/// subadminid : 2
/// country : "🇵🇰    Pakistan"
/// state : "null"
/// city : "null"
/// houseaddress : "Rawat Enclave,Block#1,Street#1,House#1"
/// vechileno : ""
/// residenttype : "Owner"
/// propertytype : "house"
/// committeemember : 0
/// status : 1
/// created_at : "2023-04-28T12:43:42.000000Z"
/// updated_at : "2023-04-28T14:44:23.000000Z"

class Resident {
  Resident({
      this.id, 
      this.residentid, 
      this.subadminid, 
      this.country, 
      this.state, 
      this.city, 
      this.houseaddress, 
      this.vechileno, 
      this.residenttype, 
      this.propertytype, 
      this.committeemember, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Resident.fromJson(dynamic json) {
    id = json['id'];
    residentid = json['residentid'];
    subadminid = json['subadminid'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    houseaddress = json['houseaddress'];
    vechileno = json['vechileno'];
    residenttype = json['residenttype'];
    propertytype = json['propertytype'];
    committeemember = json['committeemember'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? residentid;
  int? subadminid;
  String? country;
  String? state;
  String? city;
  String? houseaddress;
  String? vechileno;
  String? residenttype;
  String? propertytype;
  int? committeemember;
  int? status;
  String? createdAt;
  String? updatedAt;
Resident copyWith({  int? id,
  int? residentid,
  int? subadminid,
  String? country,
  String? state,
  String? city,
  String? houseaddress,
  String? vechileno,
  String? residenttype,
  String? propertytype,
  int? committeemember,
  int? status,
  String? createdAt,
  String? updatedAt,
}) => Resident(  id: id ?? this.id,
  residentid: residentid ?? this.residentid,
  subadminid: subadminid ?? this.subadminid,
  country: country ?? this.country,
  state: state ?? this.state,
  city: city ?? this.city,
  houseaddress: houseaddress ?? this.houseaddress,
  vechileno: vechileno ?? this.vechileno,
  residenttype: residenttype ?? this.residenttype,
  propertytype: propertytype ?? this.propertytype,
  committeemember: committeemember ?? this.committeemember,
  status: status ?? this.status,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['residentid'] = residentid;
    map['subadminid'] = subadminid;
    map['country'] = country;
    map['state'] = state;
    map['city'] = city;
    map['houseaddress'] = houseaddress;
    map['vechileno'] = vechileno;
    map['residenttype'] = residenttype;
    map['propertytype'] = propertytype;
    map['committeemember'] = committeemember;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 4
/// firstname : "Umer"
/// lastname : "Bashir"
/// cnic : "1"
/// address : "Rawat Enclave,Block#1,Street#1,House#1"
/// mobileno : "0300"
/// password : "$2y$10$Y672rdtIgtV2..GAlFheb.yqFv4FcdlCGAvdz2lvSD0vTnkfMjZxi"
/// roleid : 3
/// rolename : "resident"
/// image : "images/user.png"
/// fcmtoken : "d2sFJLkXSeiS0jdh2nzlAD:APA91bHVNWN4Do2KozEFBt-g-9MTC1EJEBeFKxGx_xbhCj6ds25G6Z2EczQLRuHDX08uJFkf_A4hzrqEYKjIXaBM2slYoLkf4Pep-6f04VXDye9DUbfj5xV-SIJ1Nxw_e2AW7AOXPLSx"
/// created_at : "2023-04-28T12:42:54.000000Z"
/// updated_at : "2023-04-28T14:46:02.000000Z"

class User {
  User({
      this.id, 
      this.firstname, 
      this.lastname, 
      this.cnic, 
      this.address, 
      this.mobileno, 
      this.password, 
      this.roleid, 
      this.rolename, 
      this.image, 
      this.fcmtoken, 
      this.createdAt, 
      this.updatedAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    cnic = json['cnic'];
    address = json['address'];
    mobileno = json['mobileno'];
    password = json['password'];
    roleid = json['roleid'];
    rolename = json['rolename'];
    image = json['image'];
    fcmtoken = json['fcmtoken'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? firstname;
  String? lastname;
  String? cnic;
  String? address;
  String? mobileno;
  String? password;
  int? roleid;
  String? rolename;
  String? image;
  String? fcmtoken;
  String? createdAt;
  String? updatedAt;
User copyWith({  int? id,
  String? firstname,
  String? lastname,
  String? cnic,
  String? address,
  String? mobileno,
  String? password,
  int? roleid,
  String? rolename,
  String? image,
  String? fcmtoken,
  String? createdAt,
  String? updatedAt,
}) => User(  id: id ?? this.id,
  firstname: firstname ?? this.firstname,
  lastname: lastname ?? this.lastname,
  cnic: cnic ?? this.cnic,
  address: address ?? this.address,
  mobileno: mobileno ?? this.mobileno,
  password: password ?? this.password,
  roleid: roleid ?? this.roleid,
  rolename: rolename ?? this.rolename,
  image: image ?? this.image,
  fcmtoken: fcmtoken ?? this.fcmtoken,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['cnic'] = cnic;
    map['address'] = address;
    map['mobileno'] = mobileno;
    map['password'] = password;
    map['roleid'] = roleid;
    map['rolename'] = rolename;
    map['image'] = image;
    map['fcmtoken'] = fcmtoken;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}