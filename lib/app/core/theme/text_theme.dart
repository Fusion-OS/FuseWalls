import 'package:flutter/material.dart';
import 'package:fuse_walls/app/core/theme/app_theme.dart';

TextStyle getTitleTextStyle(context) {
  return TextStyle(
      fontFamily: "Satisfy",
      fontSize: 32,
      color: getMonetOnBGColor(context),
      shadows: const [
        Shadow(
          offset: Offset(0, 4.0),
          blurRadius: 4.0,
          color: Color(0x25000000),
        ),
      ]);
}
