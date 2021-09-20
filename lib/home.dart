import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> listScreen = [
    layananScreen(),
    Text("Screen 2", style: TextStyle(fontSize: 30)),
    Text("Screen 3", style: TextStyle(fontSize: 30)),
    Text("Screen 4", style: TextStyle(fontSize: 30)),
    Text("Screen 5", style: TextStyle(fontSize: 30)),
  ];

  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BPJSTKU"),
        centerTitle: true,
      ),
      body: listScreen.elementAt(currentScreen),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_repair_service), label: 'Layanan'),
          BottomNavigationBarItem(icon: Icon(Icons.add_alert_sharp), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.announcement), label: 'Berita'),
          BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined), label: 'Kontak'),
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

Widget layananScreen() {
  final double space = 25, headerSpace = 15;
  return SingleChildScrollView(
    child: Center(
      child: Container(
        width: 400,
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "JAMINAN HARI TUA (JHT)",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.all(headerSpace),
                            child: Image.asset('icons/icon_saldo.PNG'),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.all(headerSpace),
                            child: Image.asset('icons/icon_simulation.PNG'),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.all(headerSpace),
                            child: Image.asset('icons/icon_queue.PNG'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 350,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 10 / 12,
                  mainAxisSpacing: space,
                  crossAxisSpacing: space,
                  children: [
                    customButton("KARTU DIGITAL", "icons/icon_card.PNG"),
                    customButton("KECELAKAAN KERJA", "icons/icon_report.PNG"),
                    customButton("INFO PROGRAM", "icons/icon_info.PNG"),
                    customButton("MITRA LAYANAN", "icons/icon_partner.PNG"),
                    customButton("KANTOR CABANG", "icons/icon_branch.PNG"),
                    customButton("PENGADUAN", "icons/icon_complaint.PNG"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget customButton(String text, String icon) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(icon),
      Flexible(
        child: Text(
          text,
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
        ),
      ),
    ],
  );
}
