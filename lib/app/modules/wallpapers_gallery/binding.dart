import 'package:fuse_walls/app/modules/wallpapers_gallery/controller.dart';
import 'package:get/get.dart';

class WallpapersGalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WallpapersGalleryController());
  }
}
