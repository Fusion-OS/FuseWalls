import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuse_walls/app/core/theme/app_theme.dart';
import 'package:fuse_walls/app/core/theme/text_theme.dart';
import 'package:fuse_walls/app/global_widgets/backscreen_icon.dart';
import 'package:fuse_walls/app/global_widgets/change_theme_widgets.dart';
import 'package:fuse_walls/app/modules/preview_wall/local_widgets/preview_copywalls.dart';
import 'package:fuse_walls/app/modules/preview_wall/local_widgets/preview_setwalls.dart';
import 'package:fuse_walls/app/modules/preview_wall/local_widgets/preview_sharewalls.dart';
import 'package:get/get.dart';

import 'controller.dart';

class PreviewWall extends GetView<PreviewWallController> {
  const PreviewWall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.delete<PreviewWallController>();
        Get.back;
        return true;
      },
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: getMonetBGColor(context)),
        child: Scaffold(
          backgroundColor: getMonetBGColor(context),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 80,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: backScreenIcon(context),
                        onTap: () {
                          Get.delete<PreviewWallController>();
                          Get.back();
                        },
                      ),
                      Text("Preview",
                          textAlign: TextAlign.center,
                          style: getTitleTextStyle(context)),
                      changeThemeWidget(context),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: controller.obx((state) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image(
                            fit: BoxFit.cover,
                            image: FileImage(
                              controller.wallFile.value,
                            ),
                          ),
                        );
                      }, onError: (e) {
                        return SvgPicture.asset(
                          "assets/svg/error.svg",
                        );
                      },
                          onLoading: const Center(
                              child: CircularProgressIndicator()))),
                ),
                controller.obx((state) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    height: 80,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          shareWallsWidget(controller),
                          setWallsWidget(context, controller),
                          copyWallsWidget(controller)
                        ],
                      ),
                    ),
                  );
                }, onLoading: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
