import 'package:flutter/material.dart';

Widget copyWallsWidget(controller) {
  return SizedBox(
    height: 50,
    child: TextButton(
        onPressed: () {
          controller.copyToDownloadsFoler();
        },
        style: TextButton.styleFrom(shape: const CircleBorder()),
        child: const Center(
            child: Icon(
          Icons.download,
          size: 22,
        ))),
  );
}
