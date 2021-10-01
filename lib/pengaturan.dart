import 'package:bpjs/controller/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Pengaturan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double margins = 35;
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController noKTP = TextEditingController();
    TextEditingController ttl = TextEditingController();
    TextEditingController alamat = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pengaturan"),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Center(
          child: Container(
            width: 411,
            child: ListView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      "Update Profil Saya",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: margins),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      hintText: "Nama Lengkap",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: margins),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: "E-mail",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: margins),
                  child: TextFormField(
                    controller: noKTP,
                    decoration: InputDecoration(
                      hintText: "Nomor KTP/Paspor",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: margins),
                  child: TextFormField(
                    controller: ttl,
                    decoration: InputDecoration(
                      hintText: "Tempat/TanggalLahir",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: margins),
                  child: TextFormField(
                    controller: alamat,
                    decoration: InputDecoration(
                      hintText: "Alamat",
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10, horizontal: margins),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("UPDATE"),
                    onPressed: () {
                      GetStorage pref = GetStorage();
                      if (name.value.text != null &&
                          name.value.text.isNotEmpty) {
                        pref.remove("nama");
                        pref.write("nama", name.value.text);
                      }
                      if (email.value.text != null &&
                          email.value.text.isNotEmpty) {
                        pref.write("email", email.value.text);
                      }
                      if (noKTP.value.text != null &&
                          noKTP.value.text.isNotEmpty) {
                        pref.write("noKTP", noKTP.value.text);
                      }
                      if (ttl.value.text != null && ttl.value.text.isNotEmpty) {
                        pref.write("tglLahir", ttl.value.text);
                      }
                      if (alamat.value.text != null &&
                          alamat.value.text.isNotEmpty) {
                        pref.write("alamat", alamat.value.text);
                      }
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Navigation()),
                              (route) => false);
                    },
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10, horizontal: margins),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("DELETE ACCOUNT"),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
