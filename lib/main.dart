import 'package:bpjs/home.dart';
import 'package:bpjs/login.dart';
import 'package:flutter/material.dart';
import 'comingsoon.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (c) => MultiState(),
        )
      ],
      child: MaterialApp(
        title: "BPJS",
        home: RegistrationPage(),
    //     ( if (ms!.token != null)
    //           HomePage()
    // else
    //     RegistrationPage()),
        //MaterialPageRoute(builder: (context) => ms!.token != null ? HomePage() : LoginPage()),


        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MultiState extends ChangeNotifier {
  String? token;

  setToken(String value) {
    this.token = value;
    notifyListeners();
  }
}

class RegistrationPage extends StatelessWidget {
  MultiState? ms;

  @override
  Widget build(BuildContext context) {
    ms = Provider.of<MultiState>(context);
    void _comingSoon(String _title) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ComingSoonPage(title: _title)),
      );
    }

    return ms!.token != null ? HomePage() :
      Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 411,
          child: ListView(
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
                    Navigator.of(context).push(
                        // LoginPage()
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    //ms!.token != null ? HomePage() : LoginPage()),
                    );
                  },
                ),
              ),
            ],
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
