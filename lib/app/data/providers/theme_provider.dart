import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get_storage/get_storage.dart';

ThemeMode getThemeMode() {
  String themeModefromDB = 'dark'.val('themeMode').val;
  return themeModefromDB == 'dark' ? ThemeMode.dark : ThemeMode.light;
}

var themeMode = getThemeMode().obs;
