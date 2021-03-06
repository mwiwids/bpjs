import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 411,
          child: ListView(
            children: [
              Image.asset('assets/images/img_splash_header.jpeg'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: "PENDAFTARAN PESERTA BARU",
                    icon: "assets/icons/icon_new_member.jpeg",
                    click: () {
                      Navigator.pushNamed(
                        context,
                        'soon',
                        arguments: "Peserta Baru",
                      );
                    },
                  ),
                  CustomButton(
                    text: "PENDAFTARAN PENGGUNA BARU",
                    icon: "assets/icons/icon_new_user.jpeg",
                    click: () {
                      Navigator.pushNamed(
                        context,
                        'soon',
                        arguments: "Pengguna Baru",
                      );
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
                    Navigator.pushNamed(context, 'login');
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
