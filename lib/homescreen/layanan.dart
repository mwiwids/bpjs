import 'package:flutter/material.dart';

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
                          child: Image.asset('assets/icons/icon_saldo.PNG'),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(headerSpace),
                          child: Image.asset('assets/icons/icon_simulation.PNG'),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(headerSpace),
                          child: Image.asset('assets/icons/icon_queue.PNG'),
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
                  customButton("KARTU DIGITAL", "assets/icons/icon_card.PNG"),
                  customButton("KECELAKAAN KERJA", "assets/icons/icon_report.PNG"),
                  customButton("INFO PROGRAM", "assets/icons/icon_info.PNG"),
                  customButton("MITRA LAYANAN", "assets/icons/icon_partner.PNG"),
                  customButton("KANTOR CABANG", "assets/icons/icon_branch.PNG"),
                  customButton("PENGADUAN", "assets/icons/icon_complaint.PNG"),
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