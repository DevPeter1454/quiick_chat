import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiick_chat/ui/common/export.dart';

class SettingsRowItem extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;
  final Color? titleColor;
  final Color? valueColor;
  final double? fontSize;

  const SettingsRowItem({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
    this.titleColor,
    this.valueColor = const Color(0xFF5E5F60),
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: AppTextstyles.mainMedium(
                  size: fontSize!,
                  color: titleColor,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    value,
                    style: AppTextstyles.mainMedium(
                      color: valueColor,
                      size: 16,
                    ),
                  ),
                  horizontalSpace(10.w),
                  SvgPicture.asset(
                    AppIcons.arrowForwardIcon,
                    color: AppColors.kcPrimaryColor,
                    height: 12.h,
                  )
                ],
              ),
            ],
          ),
          verticalSpace(11.h),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 7),
            child: Container(
              height: 1,
              color: const Color(0XFFDBDBDB).withOpacity(.5),
              width: screenWidth(context),
            ),
          ),
          verticalSpace(18.h),
        ],
      ),
    );
  }
}
