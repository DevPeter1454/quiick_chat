import 'package:flutter/material.dart';
import 'package:quiick_chat/ui/common/export.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final int? maxLines;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final bool enabled;
  final TextStyle? style;
  final bool? filled;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.maxLength,
    this.suffix,
    this.prefix,
    this.enabled = true,
    this.style,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: AppColors.kcPrimaryColor,
      style: style ?? AppTextstyles.semiBold(size: 16.51.sp),
      obscureText: obscureText,
      focusNode: focusNode,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      textAlign: textAlign,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: enabled,
      onEditingComplete: () {
        focusNode?.unfocus();
      },
      decoration: InputDecoration(
        hintText: hintText,
        filled: filled,
        fillColor: AppColors.kcPrimaryColor.withAlpha(22),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(17.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(17.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(17.r),
          borderSide: BorderSide.none,
        ),
        hintStyle:
            AppTextstyles.medium.copyWith(color: const Color(0xFFC9C9C9)),
        suffixIcon: suffix,
        prefixIcon: prefix,
      ),
    );
  }
}
