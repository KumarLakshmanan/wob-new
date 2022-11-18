import 'dart:convert';

UserModule userModuleFromJson(String str) =>
    UserModule.fromJson(json.decode(str));

String userModuleToJson(UserModule data) => json.encode(data.toJson());

class UserModule {
  UserModule({
    required this.rowno,
    required this.createdon,
    required this.storeid,
    required this.storename,
    required this.custid,
    required this.mobileno,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.gender,
  });

  String rowno;
  String createdon;
  String storeid;
  String storename;
  String custid;
  String mobileno;
  String firstname;
  String lastname;
  String email;
  String gender;

  factory UserModule.fromJson(Map<String, dynamic> json) => UserModule(
        rowno: json["rowno"],
        createdon: json["createdon"],
        storeid: json["storeid"],
        storename: json["storename"],
        custid: json["custid"],
        mobileno: json["mobileno"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "rowno": rowno,
        "createdon": createdon,
        "storeid": storeid,
        "storename": storename,
        "custid": custid,
        "mobileno": mobileno,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "gender": gender,
      };
}
