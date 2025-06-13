import 'package:flutter/material.dart';
import 'package:quiick_chat/ui/common/export.dart';

enum ABStatus { enabled, disabled, loading, error }

enum ABStyle { primary, disabled, error, grey, outline }

enum ABShape { rounded, mediumRounded }

enum ABSize { medium }

class PAppButton extends StatelessWidget {
  const PAppButton({
    super.key,
    required this.text,
    this.icon,
    required this.onTap,
    this.onLongPress,
    this.status = ABStatus.enabled,
    this.style = ABStyle.primary,
    this.shape = ABShape.rounded,
    this.size = ABSize.medium,
  });

  final String text;
  final IconData? icon;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final ABStatus status;
  final ABStyle style;
  final ABShape shape;
  final ABSize size;

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onTap: switch (status) {
        ABStatus.enabled => onTap,
        ABStatus.disabled || ABStatus.loading || ABStatus.error => null,
      },
      onLongPress: onLongPress,
      type: switch (status) {
        ABStatus.enabled => TappableType.press,
        ABStatus.disabled ||
        ABStatus.loading ||
        ABStatus.error =>
          TappableType.none,
      },
      child: Container(
        alignment: Alignment.center,
        height: switch (size) {
          ABSize.medium => 56.0,
        },
        padding: shape == ABShape.mediumRounded
            ? const EdgeInsets.symmetric(horizontal: 24, vertical: 12)
            : null,
        decoration: BoxDecoration(
          border: switch (style) {
            ABStyle.primary ||
            ABStyle.disabled ||
            ABStyle.error ||
            ABStyle.grey =>
              null,
            ABStyle.outline => Border.all(
                color: AppColors.kcPrimaryColor,
                width: 1.0,
              )
          },
          color: switch (style) {
            ABStyle.primary => AppColors.kcPrimaryColor,
            ABStyle.disabled => AppColors.kcButtonDisabledColor,
            ABStyle.error => AppColors.errorColor,
            ABStyle.grey => const Color(0xFFC4C4C4),
            ABStyle.outline => Colors.transparent,
          },
          borderRadius: switch (shape) {
            ABShape.rounded => BorderRadius.circular(8.0),
            ABShape.mediumRounded => BorderRadius.circular(15.0),
          },
        ),
        child: Text(
          text,
          style: style == ABStyle.outline
              ? AppTextstyles.medium.copyWith(
                  color: AppColors.kcPrimaryColor,
                )
              : AppTextstyles.mediumSemiBold.copyWith(
                  fontSize: 18.sp,
                  color: style == ABStyle.grey
                      ? AppColors.kcBlackColor
                      : AppColors.kcWhiteColor,
                ),
        ),
      ),
    );
  }
}
