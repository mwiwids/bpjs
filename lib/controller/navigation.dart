import 'package:bpjs/comingsoon.dart';
import 'package:bpjs/controller/state.dart';
import 'package:bpjs/home.dart';
import 'package:bpjs/login.dart';
import 'package:bpjs/registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => FirstPage(),
        'login': (BuildContext context) => LoginPage(),
        'soon': (BuildContext context) {
          final String title =
              ModalRoute.of(context)!.settings.arguments as String;
          return ComingSoonPage(title: title);
        }
      },
      onGenerateRoute: (RouteSettings? settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              ComingSoonPage(title: "Coming Soon"),
        );
      },
      initialRoute: '/',
    );
  }
}

class FirstPage extends StatelessWidget {
  MultiState? ms;

  @override
  Widget build(BuildContext context) {
    ms = Provider.of<MultiState>(context);
    return ms!.token?.isNotEmpty ?? false ? HomePage() : RegistrationPage();
  }
}
