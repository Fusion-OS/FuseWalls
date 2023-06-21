import 'package:fuse_walls/app/modules/category_menu/controller.dart';
import 'package:get/get.dart';

class CategoryMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryMenuController());
  }
}
