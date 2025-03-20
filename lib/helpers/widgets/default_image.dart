import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String image;
  final Color? iconColor;
  final BoxFit? boxFit;
  final EdgeInsetsDirectional? padding;
  final bool? requireRTL;

  const DefaultImage({
    this.height,
    this.width,
    required this.image,
    this.iconColor,
    this.boxFit,
    this.padding,
    this.requireRTL,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: (image.contains("png") ||
          image.contains("jpeg") ||
          image.contains("jpg"))
          ? Image.asset(image)
          : SvgPicture.asset(
        image,
        width: width,
        height: height,
        colorFilter: iconColor != null
            ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
            : null,
        fit: boxFit ?? BoxFit.contain,
        matchTextDirection: requireRTL ?? true,
      ),
    );
  }
}
