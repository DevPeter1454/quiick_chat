import 'dart:ui';
import 'package:flutter/material.dart';

class Blur extends StatelessWidget {
  final Widget child;
  final double blur;
  final Color? overlayColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry padding;

  const Blur({
    super.key,
    required this.child,
    this.blur = 5.0,
    this.overlayColor,
    this.borderRadius,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background blur effect
        Positioned.fill(
          child: ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.zero,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blur,
                sigmaY: blur,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: overlayColor ?? Colors.black.withOpacity(0.2),
                  borderRadius: borderRadius,
                ),
              ),
            ),
          ),
        ),
        // Content on top of the blur
        Padding(
          padding: padding,
          child: child,
        ),
      ],
    );
  }
}
