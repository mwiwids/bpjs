import 'package:flutter/material.dart';

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