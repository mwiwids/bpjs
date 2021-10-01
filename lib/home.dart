import 'package:bpjs/homescreen/berita.dart';
import 'package:bpjs/homescreen/kontak.dart';
import 'package:bpjs/homescreen/layanan.dart';
import 'package:bpjs/homescreen/notifikasi.dart';
import 'package:bpjs/homescreen/profil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavBar();
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    List<String> listTitle = [
      "BPJSTKU",
      "Notifikasi",
      "Berita",
      "Kontak",
      "Akun Saya",
    ];

    List<Widget> listScreen = [
      layananScreen(),
      notifikasiScreen(),
      beritaScreen(),
      kontakScreen(),
      ProfilScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(listTitle.elementAt(currentScreen)),
        centerTitle: true,
      ),
      body: listScreen.elementAt(currentScreen),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_repair_service), label: 'Layanan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert_sharp), label: 'Notifikasi'),
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement), label: 'Berita'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: 'Kontak'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: this.currentScreen,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black45,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            this.currentScreen = index;
          });
        },
      ),
    );
  }
}
