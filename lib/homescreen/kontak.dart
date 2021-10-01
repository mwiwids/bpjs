import 'package:flutter/material.dart';

Widget kontakScreen() {
  return Center(
    child: Container(
      height: double.infinity,
      width: 411,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Layanan Masyarakat",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset(
                "assets/images/img_ask_bpjs.PNG",
                width: 100,
                height: 100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/icon_whatsapp.PNG",
                  width: 32,
                  height: 32,
                ),
                Text("Whatsapp"),
              ],
            ),
            Text("+62 811-9115910"),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("+62 855-9551950"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Text(
                "Layanan Whatsapp hanya untuk Pekerja Migran Indonesia di Luar Negeri",
                style: TextStyle(color: Colors.green),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Text(
                "Layanan Masyarakat BPJS Ketenagakerjaan melayani Anda mulai pukul 06:00 hingga pukul 22:00 WIB",
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Image.asset("assets/images/img_customer_care.PNG"),
            )
          ],
        ),
      ),
    ),
  );
}