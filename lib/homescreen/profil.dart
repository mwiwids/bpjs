import 'package:bpjs/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget profilScreen(BuildContext context) {
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
                    backgroundImage: AssetImage("images/img_avatar.jpeg"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Soekarno",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "admin@soekarno.id",
                      ),
                      Container(
                        child: ElevatedButton(
                          child: Text("Pengaturan"),
                          onPressed: () {},
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
                  "Soekarno",
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
                  "3526010000000000",
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
                  "Surabaya, 06 Juni 1901",
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
                  "Surabaya",
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
                  print("Tentang Aplikasi");
                },
              ),
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text("Syarat dan Ketentuan"),
                onPressed: () {
                  print("Syarat dan Ketentuan");
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
                        alertDialogModifikasi(context)),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget alertDialogModifikasi(BuildContext context) {
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
          final ms = Provider.of<MultiState>(context, listen: false);
          ms.setToken("");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => RegistrationPage()),
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
          }),
    ],
  );
}
