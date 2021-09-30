import 'package:bpjs/model/mlogindata.dart';

class MLogin {
  MLogin({
      this.status, 
      this.message, 
      this.data,});

  MLogin.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(MLoginData.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  List<MLoginData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

