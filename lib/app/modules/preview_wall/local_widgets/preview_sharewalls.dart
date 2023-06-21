import 'package:flutter/material.dart';

Widget shareWallsWidget(controller) {
  return SizedBox(
    height: 50,
    child: TextButton(
        style: TextButton.styleFrom(shape: const CircleBorder()),
        onPressed: () {
          controller.shareWallpaper();
        },
        child: const Icon(
          Icons.share,
          size: 22,
        )),
  );
}
