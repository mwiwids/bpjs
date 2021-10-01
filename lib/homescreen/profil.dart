import 'package:bpjs/comingsoon.dart';
import 'package:bpjs/controller/navigation.dart';
import 'package:bpjs/controller/state.dart';
import 'package:bpjs/pengaturan.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class ProfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetStorage pref = GetStorage();
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 45.0,
                      backgroundImage: AssetImage("assets/images/img_avatar.jpeg"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${pref.read("nama")}",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          "${pref.read("email")}",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Container(
                          child: ElevatedButton(
                            child: Text("Pengaturan"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Pengaturan(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.all(10),
            color: Colors.white,
            height: 200,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Profil Saya",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  "Nama Lengkap",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "${pref.read("nama")}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Text(
                  "Nomor KTP/Paspor",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "${pref.read("noKTP")}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Text(
                  "Tanggal Lahir",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "${pref.read("tglLahir")}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Text(
                  "Alamat",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "${pref.read("alamat")}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: double.infinity,
            height: 150,
            child: ListView(
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text("Tentang Aplikasi"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ComingSoonPage(title: "Tentang Aplikasi"),
                      ),
                    );
                  },
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text("Syarat dan Ketentuan"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ComingSoonPage(title: "Syarat dan Ketentuan"),
                      ),
                    );
                  },
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text("Logout"),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        alertDialogModifikasi(context),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget alertDialogModifikasi(BuildContext context) {
  MultiState? ms;

  return AlertDialog(
    content: Container(
      child: Text("Apakah anda yakin ingin logout?"),
    ),
    title: Text("Logout"),
    actions: [
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
        ),
        child: Text("Ya"),
        onPressed: () {
          ms = Provider.of<MultiState>(context, listen: false);
          ms?.setToken("");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Navigation()),
              (route) => false);
        },
      ),
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        child: Text("Tidak"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
