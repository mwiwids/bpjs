import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  MultiState? ms;

  @override
  Widget build(BuildContext context) {
    ms = Provider.of<MultiState>(context);
    return ChangeNotifierProvider(
      create: (_) => KontenState(this.ms, context),
      child: Consumer<KontenState>(
        builder: (context, state, _) {
          return BottomNavBar();
        },
      ),
    );
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
      profilScreen(context),
    ];

    return Scaffold(
      backgroundColor: Colors.black12,
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
                onPressed: () {
                  final ms = Provider.of<MultiState>(context, listen: false);
                  ms.setToken("");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrationPage()),
                      (route) => false);
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

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
              child: Image.asset("images/img_customer_care.PNG"),
            )
          ],
        ),
      ),
    ),
  );
}

Widget _gridItem(String judulBerita) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    padding: EdgeInsets.all(5),
    color: Colors.white,
    width: double.infinity,
    height: 150,
    child: Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/img_no_image.png"),
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  judulBerita,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("x hari lalu"),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget beritaScreen() {
  var listJudulBerita = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel elit ",
    "maximus vitae. Cras eleifend scelerisque mi consequat malesuada. Nullam u",
    "nisi, eu consectetur ipsum pharetra ac. Sed facilisis mi in dolor hendrer",
    "ultrices posuere cubilia curae; Morbi ut augue diam. Vestibulum ante ipsu",
    "Mauris nibh sem, semper sit amet ipsum at, semper imperdiet erat. Curabit",
    "Mauris dui risus, tempor in dictum nec, scelerisque a mauris. Praesent he",
    "Pellentesque mauris nulla, accumsan a justo sit amet, eleifend laoreet fe",
    "Donec at lacus dictum, imperdiet nisi non, hendrerit nibh.",
  ];

  return Center(
    child: Container(
      width: 411,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 411 / 144),
        itemBuilder: (buildContext, index) {
          return _gridItem(listJudulBerita[index]);
        },
        itemCount: listJudulBerita.length,
      ),
    ),
  );
}

Widget notifikasiScreen() {
  return Center(
    child: SingleChildScrollView(
      child: Column(
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
    ),
  );
}

Widget layananScreen() {
  final double space = 25, headerSpace = 15;
  return Center(
    child: Container(
      width: 411,
      color: Colors.white,
      child: ListView(
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
