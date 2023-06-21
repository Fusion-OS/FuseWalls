import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fuse_walls/app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key, required this.title, required this.thumbnailUrl})
      : super(key: key);
  final String title;
  final String thumbnailUrl;
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    return AspectRatio(
        aspectRatio: 285 / 200,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  errorWidget: (context, url, error) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline_outlined, size: 100),
                        Text(
                          error,
                          style: Theme.of(context).textTheme.displayMedium,
                        )
                      ],
                    );
                  },
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  imageUrl: thumbnailUrl,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Blur(
                    blur: 4,
                    blurColor: const Color(0xFFBBBBBB),
                    colorOpacity: 0.1,
                    child: SizedBox(
                      height: height * 0.07,
                      width: width,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    margin: const EdgeInsets.only(right: 18),
                    alignment: Alignment.centerRight,
                    child: Text(
                      toBeginningOfSentenceCase(title)!,
                      style: const TextStyle(
                        fontFamily: "Satisfy",
                        color: Colors.black,
                        fontSize: 34.0,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.GALLERY,
                          arguments: {"categoryName": title});
                    },
                  ),
                )
              ],
            )));
  }
}
