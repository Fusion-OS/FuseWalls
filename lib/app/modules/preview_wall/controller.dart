import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fuse_walls/app/data/providers/theme_provider.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class PreviewWallController extends GetxController with StateMixin {
  var path = "";
  var wallFile = File("").obs;

  Future<void> downloadWallpaper(String url) async {
    wallFile.value = await DefaultCacheManager().getSingleFile(url);
  }

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    var args = Get.arguments;
    path = args["path"];
    // await Permission.storage.request();
    // wallFile.value = await getImageFileFromAssets(path);
    try {
      await downloadWallpaper(path);
      change(null, status: RxStatus.success());
      super.onInit();
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }

    // await getAccetColor();
  }

  @override
  void onClose() {
    path = "";

    super.onClose();
  }

  void setWallpaper({required int location}) async {
    try {
      WallpaperManagerFlutter()
          .setwallpaperfromFile(wallFile.value, location)
          .then((value) {
        Get.back();
        Get.showSnackbar(GetSnackBar(
          title: "Wallpaper set!",
          duration: const Duration(seconds: 2),
          backgroundColor: themeMode.value == ThemeMode.dark
              ? Get.theme.colorScheme.primaryContainer
              : Get.theme.colorScheme.secondary,
          animationDuration: const Duration(milliseconds: 800),
          message: "Wallpaper has been set",
        ));
      });
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: "Error",
        duration: const Duration(seconds: 2),
        backgroundColor: Get.theme.colorScheme.error,
        animationDuration: const Duration(milliseconds: 800),
        message: "Error setting wallpaper\n${e.toString()}",
      ));
    }
  }

  void shareWallpaper() {
    Share.shareFiles([wallFile.value.path]);
  }

  void copyToDownloadsFoler() async {
    await Permission.storage.request();
    var downloadPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);

    await wallFile.value
        .copy("$downloadPath/${path.split('/').last}")
        .then((value) => Get.showSnackbar(GetSnackBar(
              title: "Wallpaper downloaded!",
              duration: const Duration(seconds: 2),
              backgroundColor: themeMode.value == ThemeMode.dark
                  ? Get.theme.colorScheme.primaryContainer
                  : Get.theme.colorScheme.secondary,
              animationDuration: const Duration(milliseconds: 800),
              message: "Wallpaper copied to downloads folder",
            )));
  }

  // Future<void> getAccetColor() async {
  //   PaletteGenerator generator = await getDominantColor(path);
  //   // accentColor = themeMode.value == ThemeMode.dark
  //   //     ? generator.darkVibrantColor?.color
  //   //     : generator.lightVibrantColor?.color;
  //   accentColor = generator.dominantColor?.color;
  // }
}
