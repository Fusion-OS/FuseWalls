import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:fuse_walls/app/data/models/wall_model.dart';
import 'package:path_provider/path_provider.dart';

Map allWallpapers = {};

Future<void> getAllWallpapers() async {
  allWallpapers.clear();
  allWallpapers = {"categories": <Map>[]};
  var docDir = await getApplicationDocumentsDirectory();
  var client = Dio();
  final options = CacheOptions(
    store: HiveCacheStore(docDir.path),
    policy: CachePolicy.request,
    priority: CachePriority.normal,
  );

  client.interceptors.add(DioCacheInterceptor(options: options));
  String baseUrl =
      "https://raw.githubusercontent.com/Fusion-OS/FuseWalls/twelve/assets/walls";
  var request = await client.get("$baseUrl/wallpapers.json");
  var jsonData = json.decode(request.data);

  allWallpapers["date"] = jsonData["date"];
  for (var k = 0; k < jsonData["categories"].length; k++) {
    List tempWalls = [];
    Map categoryData = jsonData["categories"][k];
    String categoryName = categoryData["name"];
    allWallpapers["categories"].add(
        {"name": categoryName, "thumb": "$baseUrl/${categoryData["thumb"]}"});
    jsonData[categoryName]["paths"]
        .forEach((wall) => tempWalls.add(WallModel.fromJson(wall)));
    allWallpapers[categoryName] = tempWalls;
  }
}
