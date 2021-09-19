import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BPJS",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _comingSoon(String _title) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ComingSoonPage(title: _title)));
    }

    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('images/img_splash_header.jpeg'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: "PENDAFTARAN PESERTA BARU",
                      icon: "icons/icon_new_member.jpeg",
                      click: () {
                        _comingSoon("Peserta Baru");
                      },
                    ),
                    CustomButton(
                      text: "PENDAFTARAN PENGGUNA BARU",
                      icon: "icons/icon_new_user.jpeg",
                      click: () {
                        _comingSoon("Pengguna Baru");
                      },
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("LOGIN"),
                    onPressed: () {
                      print("Clicked LOGIN");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text, icon;
  final double size = 130;
  final Function()? click;

  const CustomButton({this.text = "", this.icon = "", this.click});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.all(15),
        width: size,
        child: Column(
          children: [
            InkWell(
              onTap: click ?? () {},
              splashColor: Colors.brown.withOpacity(0.5),
              child: Ink(
                height: size,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(icon),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(child: Text("Coming Soon...")),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
