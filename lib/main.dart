import 'package:bpjs/controller/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/state.dart';

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
        home: Navigation(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
