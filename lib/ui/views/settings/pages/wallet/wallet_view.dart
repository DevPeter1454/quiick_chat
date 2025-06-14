import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:stacked/stacked.dart';

import 'wallet_viewmodel.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletViewModel>.reactive(
      viewModelBuilder: () => WalletViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.kcWhiteColor,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 35.0, right: 35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      "Wallets",
                      style: AppTextstyles.semiBold(
                          color: AppColors.kcPrimaryColor, size: 22.sp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.add,
                      color: AppColors.kcPrimaryColor,
                    ).onTap(() => model.navigateToAddCard())
                  ],
                ),
                verticalSpace(13.h),
                Image.asset(AppImages.walletBackdrop),
                verticalSpace(16.h),
                Container(
                  width: screenWidth(context),
                  height: 44,
                  padding: EdgeInsets.only(left: 8.w, right: 8.w),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x332B2D33),
                        blurRadius: 24,
                        offset: Offset(0, 10),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 146,
                        height: 44,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF00B456),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(110),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.sendIcon),
                            horizontalSpace(10.w),
                            Text(
                              "Receive",
                              style: AppTextstyles.semiBoldFigtree(
                                  color: AppColors.kcWhiteColor),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 146,
                        height: 44,
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF00B456),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(110),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.qrCodeIcon),
                            horizontalSpace(10.w),
                            Text(
                              "Receive",
                              style: AppTextstyles.semiBoldFigtree(
                                  color: AppColors.kcWhiteColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                verticalSpace(22.h),
                Text(
                  "Recent transactions",
                  textAlign: TextAlign.left,
                  style: AppTextstyles.semiBoldFigtree(
                      color: const Color(0XFFA7A7A7)),
                ),
                verticalSpace(9.h),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 26.0),
                          child: index == 0
                              ? Column(
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Color(0XFFD1D1D1),
                                      radius: 30,
                                    ),
                                    verticalSpace(5.h),
                                    Text(
                                      "Search",
                                      style: AppTextstyles.semiBoldFigtree(),
                                    )
                                  ],
                                )
                              : Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      margin: EdgeInsets.zero,
                                      clipBehavior: Clip.none,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            AppNetworkImages
                                                .personImages[index - 1],
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalSpace(5.h),
                                    Text(
                                      AppNetworkImages
                                          .personImagesWithName[index - 1],
                                      style: AppTextstyles.semiBoldFigtree(),
                                    )
                                  ],
                                ),
                        );
                      }),
                ),
                verticalSpace(20.h),
                Text(
                  "Notification",
                  style: AppTextstyles.bold(size: 23.33.sp),
                ),
                Column(
                  children: [
                    ListTile(
                      leading: Container(
                        width: 38.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                          // color: AppColors.kcPrimaryColor,
                          image: const DecorationImage(
                              image: NetworkImage(
                            AppNetworkImages.personOne,
                          )),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
