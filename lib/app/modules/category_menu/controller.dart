import 'package:flutter/material.dart';
import 'package:fuse_walls/app/data/providers/wall_provider.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoryMenuController extends GetxController with StateMixin {
  late ScrollController categoryScrollController = ScrollController();
  var scrollOffset = 0.0.obs;
  List categories = <Map>[];
  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    categoryScrollController.addListener(() {
      scrollOffset.value = categoryScrollController.position.pixels;
    });
    try {
      await getAllWallpapers();
      categories = allWallpapers["categories"];

      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }

    super.onInit();
  }

  @override
  void onClose() {
    categoryScrollController.dispose();
    super.onClose();
  }

  Future<void> refreshWalls() async {
    try {
      await getAllWallpapers();

      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
