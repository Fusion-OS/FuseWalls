import 'package:flutter/material.dart';
import 'package:fuse_walls/app/core/theme/app_theme.dart';
import 'package:fuse_walls/app/data/providers/theme_provider.dart';
import 'package:fuse_walls/app/data/providers/wall_provider.dart';
import 'package:fuse_walls/app/data/services/theme_services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Widget changeThemeWidget(context) {
  return GestureDetector(
      onTap: () {
        Get.bottomSheet(
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(top: Get.height * 0.02),
              children: [
                BottomSheetListTile(
                    title: "Light Mode",
                    onTap: () {
                      changeThemeMode(ThemeMode.light);
                      Get.back();
                    }),
                BottomSheetListTile(
                    title: "Dark Mode",
                    onTap: () {
                      changeThemeMode(ThemeMode.dark);
                      Get.back();
                    }),
                const Divider(),
                BottomSheetListTile(
                    title: "About",
                    onTap: () {
                      showAboutDialog(context: context, children: [
                        ListTile(
                          title: const Text("Lead : Sakthivel Nadar"),
                          onTap: () async {
                            await launch("https://t.me/SakthivelNadar");
                          },
                        ),
                        ListTile(
                          title: const Text("App Dev : Naufal Wiwit"),
                          onTap: () async {
                            await launch("https://t.me/nauFOSS");
                          },
                        ),
                        ListTile(
                          title:
                              const Text("Anime Wallpapers : Hakucho Designs"),
                          onTap: () async {
                            await launch("https://t.me/HakuchoDesign");
                          },
                        ),
                        ListTile(
                          title:
                              const Text("Liquid Wallpapers : Vaisakh Murali"),
                          onTap: () async {
                            await launch("https://t.me/mvaisakh");
                          },
                        ),
                        ListTile(
                          title: const Text("Material Wallpapers : AmaanCG"),
                          onTap: () async {
                            await launch("https://t.me/wallfever");
                          },
                        ),
                        ListTile(
                          title: const Text("Fusion-OS Discussions"),
                          onTap: () async {
                            await launch("https://t.me/fusionoschat");
                          },
                        ),
                        ListTile(
                          title: const Text("Fusion-OS Channel"),
                          onTap: () async {
                            await launch("https://t.me/fusionos");
                          },
                        )
                      ]);
                    }),
                Text(
                  allWallpapers["date"],
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            backgroundColor: getMonetBGColor(context));
      },
      child: Icon(
        themeMode.value == ThemeMode.light ? Icons.wb_sunny : Icons.mode_night,
        color: getMonetOnBGColor(context),
      ));
}

class BottomSheetListTile extends StatelessWidget {
  const BottomSheetListTile(
      {required this.onTap, required this.title, Key? key})
      : super(key: key);

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        onTap: onTap);
  }
}

// => showAdaptiveActionSheet(
//               context: context,
//               bottomSheetColor: getMonetBGColor(context),
//               actions: [
//                 BottomSheetAction(
//                     title: const Text("Light Mode"),
//                     onPressed: () {
//                       changeThemeMode(ThemeMode.light);
//                       Get.back();
//                     }),
//                 BottomSheetAction(
//                     title: const Text("Dark Mode"),
//                     onPressed: () {
//                       changeThemeMode(ThemeMode.dark);
//                       Get.back();
//                     })
//               ])
