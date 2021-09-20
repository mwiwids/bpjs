import 'package:flutter/material.dart';

class LayananPage extends StatelessWidget {
  final double space = 25, headerSpace= 15;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BPJSTKU"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 400,
              child: Column(
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
                            CustomButton(
                              text: "KARTU DIGITAL",
                              icon: "icons/icon_card.PNG",
                            ),
                            CustomButton(
                              text: "KECELAKAAN KERJA",
                              icon: "icons/icon_report.PNG",
                            ),
                            CustomButton(
                              text: "INFO PROGRAM",
                              icon: "icons/icon_info.PNG",
                            ),
                            CustomButton(
                              text: "MITRA LAYANAN",
                              icon: "icons/icon_partner.PNG",
                            ),
                            CustomButton(
                              text: "KANTOR CABANG",
                              icon: "icons/icon_branch.PNG",
                            ),
                            CustomButton(
                              text: "PENGADUAN",
                              icon: "icons/icon_complaint.PNG",
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text, icon;

  const CustomButton({this.text = "", this.icon = ""});

  @override
  Widget build(BuildContext context) {
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
}
