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
    notifikasiScreen(),
    Text("Berita", style: TextStyle(fontSize: 30)),
    kontakScreen(),
    Text("Profil", style: TextStyle(fontSize: 30)),
  ];

  List<String> listTitle = [
    "BPJSTKU",
    "Notifikasi",
    "Berita",
    "Kontak",
    "Akun Saya",
  ];

  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

Widget kontakScreen() {
  return SingleChildScrollView(
    child: Center(
      child: Container(
        width: 411,
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
                "images/img_ask_bpjs.PNG",
                width: 100,
                height: 100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "icons/icon_whatsapp.PNG",
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
                style: TextStyle(color: Colors.green),textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Text(
                  "Layanan Masyarakat BPJS Ketenagakerjaan melayani Anda mulai pukul 06:00 hingga pukul 22:00 WIB", textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Image.asset("images/img_customer_care.PNG"),
            )
          ],
        ),
      ),
    ),
  );
}

Widget notifikasiScreen() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.assignment_turned_in_outlined,
            size: 50,
            color: Colors.black45,
          ),
        ),
        Text(
          "Belum Ada Notifikasi",
          style: TextStyle(color: Colors.black45),
        )
      ],
    ),
  );
}

Widget layananScreen() {
  final double space = 25, headerSpace = 15;
  return SingleChildScrollView(
    child: Center(
      child: Container(
        width: 411,
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
