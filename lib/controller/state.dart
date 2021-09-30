import 'dart:convert';

import 'package:bpjs/controller/navigation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bpjs/model/mlogin.dart';
import 'package:bpjs/model/mlogindata.dart';

class MultiState extends ChangeNotifier {
  String? token;

  setToken(String? value) {
    this.token = value;
    print('TOKEN : ${value}');
    notifyListeners();
  }
}

class LoginState extends ChangeNotifier {
  MultiState? ms;
  TextEditingController uname = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? warning;
  MLoginData? data;
  bool? muncul = false;

  prosesLogin(BuildContext context, MultiState? mss) {
    this.ms = mss;
    this.muncul = false;
    this.warning = "";
    this.data = null;
    notifyListeners();
    Uri url = Uri.parse("https://sfa.forcapos.xyz/api/account/login");
    var header;
    var body = {
      "m_akun_namapengguna": uname.text,
      "m_akun_password": pass.text
    };
    http.post(url, headers: header, body: body).then((value) {
      print(value.body);
      try {
        if (value.body.isNotEmpty) {
          var json = jsonDecode(value.body);
          MLogin dataStatus = MLogin.fromJson(json);
          if (dataStatus.status!.toUpperCase() == "OK") {
            if (dataStatus.data!.length > 0) {
              data = dataStatus.data!.first;
              this.muncul = true;
              ms!.setToken(data!.mToken);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Navigation()),
                  (route) => false);
            } else {
              this.warning = "Data kosong";
            }
          } else {
            this.warning = dataStatus.message;
          }
        } else {
          this.warning = "Data tidak ada";
        }
      } catch (e) {
        this.warning = "${e.toString()} Ups.. Sepertinya ada masalah";
      }
      notifyListeners();
    });
  }
}
