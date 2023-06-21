import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuse_walls/app/data/providers/theme_provider.dart';
import 'package:fuse_walls/app/routes/pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/routes.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then((_) {
    runApp(
      const MyApp(),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return GetMaterialApp(
        getPages: AppPages.pages,
        title: 'FuseWalls',
        initialRoute: Routes.MENU,
        theme: lightDynamic == null
            ? ThemeData(
                dialogBackgroundColor:
                    ThemeData.light().copyWith().colorScheme.background,
                colorScheme: ThemeData.light().copyWith().colorScheme,
              )
            : ThemeData(colorScheme: lightDynamic),
        darkTheme: darkDynamic == null
            ? ThemeData(
                colorScheme: ThemeData.dark().copyWith().colorScheme,
                dialogBackgroundColor:
                    ThemeData.dark().copyWith().colorScheme.background,
              )
            : ThemeData(colorScheme: darkDynamic),
        themeMode: getThemeMode(),
      );
    });
  }
}
