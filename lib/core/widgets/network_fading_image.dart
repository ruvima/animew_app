import 'package:flutter/material.dart';

class NetworkFadingImage extends StatelessWidget {
  const NetworkFadingImage({
    Key? key,
    required this.path,
    this.tag,
  }) : super(key: key);
  final String path;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'image_$tag',
      child: Image.network(
        path,
        fit: BoxFit.cover,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            child: child,
          );
        },
        errorBuilder: (_, __, ___) => const SizedBox(),
      ),
    );
  }
}
