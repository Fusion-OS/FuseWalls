import 'package:fuse_walls/app/modules/preview_wall/controller.dart';
import 'package:get/get.dart';

class PreviewWallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreviewWallController());
  }
}
