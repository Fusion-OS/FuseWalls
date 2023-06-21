import 'package:fuse_walls/app/modules/category_menu/binding.dart';
import 'package:fuse_walls/app/modules/category_menu/category_menu.dart';
import 'package:fuse_walls/app/modules/preview_wall/binding.dart';
import 'package:fuse_walls/app/modules/preview_wall/preview_wall.dart';
import 'package:fuse_walls/app/modules/wallpapers_gallery/binding.dart';
import 'package:fuse_walls/app/modules/wallpapers_gallery/wallpapers_gallery.dart';
import 'package:fuse_walls/app/routes/routes.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.MENU,
        page: () => const CategoryMenu(),
        binding: CategoryMenuBinding()),
    GetPage(
        name: Routes.GALLERY,
        page: () => const WallpapersGallery(),
        binding: WallpapersGalleryBinding()),
    GetPage(
        name: Routes.PREVIEW,
        page: () => const PreviewWall(),
        binding: PreviewWallBinding()),
  ];
}
