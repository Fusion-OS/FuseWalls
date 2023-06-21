// import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
// import 'package:fuse_walls/app/data/models/wall_model.dart';
import 'package:fuse_walls/app/data/providers/wall_provider.dart';
import 'package:path_provider/path_provider.dart';

Future<List> getSpecifiedCategory(String categoryName) async {
  return allWallpapers[categoryName];
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load(path);
  final wallName = path.split('/').last;

  final file = File('${(await getTemporaryDirectory()).path}/$wallName');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}
