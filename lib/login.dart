import 'dart:ui';
import 'package:flutter/material.dart';
import 'comingsoon.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double marginHorizontal = 35;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        child: Image.asset('images/img_splash_header.jpeg'),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context, false),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      "Masuk ke Akun Saya",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: marginHorizontal),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nama Pengguna",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: marginHorizontal),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Kata Sandi"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 10, horizontal: marginHorizontal),
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("LOGIN"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ComingSoonPage(title: "Login"),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          text: "Lupa Kata Sandi",
                          click: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ComingSoonPage(title: "Lupa Kata Sandi"),
                              ),
                            );
                          },
                        ),
                        CustomButton(
                          text: "Daftar Akun",
                          click: () {
                            Navigator.pop(context, false);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? click;
  const CustomButton({this.text = "", this.click});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue,
          ),
        ),
        onTap: click ?? () {},
      ),
    );
  }
}
