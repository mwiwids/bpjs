import 'package:bpjs/comingsoon.dart';
import 'package:bpjs/controller/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  MultiState? ms;

  @override
  Widget build(BuildContext context) {
    const double margins = 35;
    ms = Provider.of<MultiState>(context);

    return ChangeNotifierProvider(
      create: (_) => LoginState(),
      child: Consumer<LoginState>(builder: (context, state, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              width: 411,
              child: ListView(
                children: [
                  Form(
                    key: state.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              child:
                                  Image.asset('assets/images/img_splash_header.jpeg'),
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
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: Text(
                              "Masuk ke Akun Saya",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: margins),
                          child: TextFormField(
                            controller: state.uname,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field ini wajib diisi';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Nama Pengguna",
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: margins),
                          child: TextFormField(
                            controller: state.pass,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field ini wajib diisi';
                              } else if (value.length < 5) {
                                return 'Jumlah karakter kurang';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(hintText: "Kata Sandi"),
                          ),
                        ),
                        if (state.warning != null)
                          Center(child: Text("${state.warning}")),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: margins),
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text("LOGIN"),
                            onPressed: () {
                              if (state.formKey.currentState!.validate()) {
                                state.prosesLogin(context, ms);
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: margins),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomInkWell(
                                text: "Lupa Kata Sandi",
                                click: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ComingSoonPage(
                                          title: "Lupa Kata Sandi"),
                                    ),
                                  );
                                },
                              ),
                              CustomInkWell(
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
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class CustomInkWell extends StatelessWidget {
  final String text;
  final Function()? click;
  const CustomInkWell({this.text = "", this.click});

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
