import 'package:bpjs/controller/navigation.dart';
import 'package:flutter/material.dart';

class MultiState extends ChangeNotifier {
  String? token;

  setToken(String value) {
    this.token = value;
    notifyListeners();
  }
}

class KontenState extends ChangeNotifier {
  MultiState? ms;
  TextEditingController uname = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  List<String> data = [];
  String? warning;
  BuildContext context;

  KontenState(this.ms, this.context) {
    if (this.ms!.token != null) {
      // getData();
    }
    // print("$data");
  }

  // getData() {
  //   if (data.length > 0) data.clear();
  //   this.data.add("Alex");
  //   this.data.add("alex@gmail.com");
  //   notifyListeners();
  // }

  // getDetailData() {
  //   print(this.warning);
  //   if (data.length > 0) data.clear();
  //   this.data.add("Alex");
  //   this.data.add("alex@gmail.com");
  //   this.data.add("27");
  //   this.data.add("Jl. Panglima Sudirman");
  //   this.data.add("Pria");
  //   notifyListeners();
  // }

  prosesLogin() {
    if (uname.text != "admin") {
      this.warning = "Username salah";
    } else if (pass.text != "123") {
      this.warning = "Password salah";
    } else {
      ms!.setToken("123456789");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Navigation()),
          (route) => false);
    }
    notifyListeners();
  }

}
