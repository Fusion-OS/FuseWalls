import 'package:flutter/material.dart';
import 'package:fuse_walls/app/data/providers/theme_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:palette_generator/palette_generator.dart';

void changeThemeMode(ThemeMode newThemeMode) {
  final box = GetStorage();
  Get.changeThemeMode(newThemeMode);
  themeMode.value = newThemeMode;
  box.write('themeMode', newThemeMode == ThemeMode.dark ? 'dark' : 'light');
}

// Future<PaletteGenerator> getDominantColor(String imagePath) async {
//   var paletteGenerator =
//       await PaletteGenerator.fromImageProvider(AssetImage(imagePath));
//   return paletteGenerator;
// }
