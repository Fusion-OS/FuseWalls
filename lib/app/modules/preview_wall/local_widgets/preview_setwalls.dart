import 'package:flutter/material.dart';
import 'package:fuse_walls/app/core/theme/app_theme.dart';
import 'package:fuse_walls/app/global_widgets/change_theme_widgets.dart';
import 'package:get/get.dart';

Widget setWallsWidget(context, controller) {
  return SizedBox(
    height: 50,
    child: TextButton(
      onPressed: () {
        Get.bottomSheet(
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              children: [
                BottomSheetListTile(
                    title: "Home Screen",
                    onTap: () {
                      controller.setWallpaper(location: 1);
                    }),
                BottomSheetListTile(
                    title: "Lock Screen",
                    onTap: () {
                      controller.setWallpaper(location: 2);
                    }),
                BottomSheetListTile(
                    title: "Home & Lock Screen",
                    onTap: () {
                      controller.setWallpaper(location: 3);
                    }),
              ],
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            backgroundColor: getMonetBGColor(context));
      },
      child: Text(
        "SET WALLPAPER",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.onPrimary),
      ),
      style: TextButton.styleFrom(
          padding: const EdgeInsets.all(14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Theme.of(context).colorScheme.primary),
    ),
  );
}
