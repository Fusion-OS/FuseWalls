import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WallpaperFrame extends StatelessWidget {
  const WallpaperFrame({Key? key, required this.thumbUrl}) : super(key: key);

  final String thumbUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: thumbUrl,
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
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress)),
      filterQuality: FilterQuality.none,
      fit: BoxFit.cover,
    );
  }
}
