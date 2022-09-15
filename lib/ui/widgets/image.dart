import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  String url;
  String? tag;

  CachedImage({super.key, required this.url, this.tag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag ?? 'photo-$url',
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
