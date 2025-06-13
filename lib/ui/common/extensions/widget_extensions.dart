import 'package:flutter/material.dart';

extension TappableExtension on Widget {
  Widget onTap(VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}

extension ContainerExtension on Container {
  Container withRipple({
    required VoidCallback onTap,
    Color? splashColor,
    BorderRadius? borderRadius,
  }) {
    return Container(
      decoration: decoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: splashColor,
          borderRadius: borderRadius,
          child: child,
        ),
      ),
    );
  }
}
