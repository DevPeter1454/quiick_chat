import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sprung/sprung.dart';

enum TappableType { press, opacity, none }

class Tappable extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final HitTestBehavior? hitTestBehavior;
  final TappableType type;

  const Tappable(
      {super.key,
      required this.child,
      this.onTap,
      this.onLongPress,
      this.hitTestBehavior,
      this.type = TappableType.press});

  @override
  State<Tappable> createState() => _TappableState();
}

class _TappableState extends State<Tappable> {
  var pressed = false;

  @override
  Widget build(BuildContext context) {
    final disabled = widget.onTap == null;

    return GestureDetector(
      behavior: widget.hitTestBehavior,
      onLongPress: widget.onLongPress == null
          ? null
          : () {
              widget.onLongPress!();
              HapticFeedback.mediumImpact();
            },
      onTap: widget.onTap == null
          ? null
          : () {
              widget.onTap!();
              HapticFeedback.mediumImpact();
            },
      onTapDown: (_) {
        if (widget.onTap == null) return;
        setState(() {
          pressed = true;
        });
      },
      onTapUp: (_) {
        if (widget.onTap == null) return;
        setState(() {
          pressed = false;
        });
      },
      onTapCancel: () {
        if (widget.onTap == null) return;
        setState(() {
          pressed = false;
        });
      },
      child: switch (widget.type) {
        TappableType.opacity => Opacity(
            opacity: disabled
                ? 0.8
                : pressed
                    ? 0.5
                    : 1.0,
            child: widget.child,
          ),
        TappableType.press => AnimatedScale(
            scale: pressed ? 0.97 : 1.0,
            duration: const Duration(milliseconds: 300),
            curve: Sprung.overDamped,
            child: widget.child,
          ),
        TappableType.none => widget.child
      },
    );
  }
}
