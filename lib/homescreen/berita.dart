import 'package:flutter/material.dart';

Widget _gridItem(String judulBerita) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    padding: EdgeInsets.all(5),
    color: Colors.white,
    width: double.infinity,
    height: 150,
    child: Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/img_no_image.png"),
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  judulBerita,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("x hari lalu"),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget beritaScreen() {
  var listJudulBerita = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel elit ",
    "maximus vitae. Cras eleifend scelerisque mi consequat malesuada. Nullam u",
    "nisi, eu consectetur ipsum pharetra ac. Sed facilisis mi in dolor hendrer",
    "ultrices posuere cubilia curae; Morbi ut augue diam. Vestibulum ante ipsu",
    "Mauris nibh sem, semper sit amet ipsum at, semper imperdiet erat. Curabit",
    "Mauris dui risus, tempor in dictum nec, scelerisque a mauris. Praesent he",
    "Pellentesque mauris nulla, accumsan a justo sit amet, eleifend laoreet fe",
    "Donec at lacus dictum, imperdiet nisi non, hendrerit nibh.",
  ];

  return Center(
    child: Container(
      width: 411,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 411 / 144),
        itemBuilder: (buildContext, index) {
          return _gridItem(listJudulBerita[index]);
        },
        itemCount: listJudulBerita.length,
      ),
    ),
  );
}