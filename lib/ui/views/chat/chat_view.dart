// import 'package:agora_chat_uikit/chat_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/common/widgets/custom_text_field.dart';
import 'package:quiick_chat/ui/views/chat/chat_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'chat_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'search'),
])
class ChatView extends StatelessWidget with $ChatView {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    // Faker faker = Faker();
    return ViewModelBuilder<ChatViewModel>.reactive(
      viewModelBuilder: () => ChatViewModel(),
      onViewModelReady: (viewModel) => syncFormWithViewModel(viewModel),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              left: 21.0,
            ),
            child: Column(
              children: [
                verticalSpace(20.h),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 35.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppIcons.filterIcon),
                      Text(
                        "Chats",
                        style: AppTextstyles.semiBold(
                            color: AppColors.kcPrimaryColor, size: 22.sp),
                      ),
                      Icon(
                        Icons.add,
                        color: AppColors.kcPrimaryColor,
                      ).onTap(() {
                        model.showAddContactDialog();
                      })
                    ],
                  ),
                ),
                verticalSpace(17.h),
                Padding(
                  padding: EdgeInsets.only(left: 9.w, right: 30.w),
                  child: CustomTextField(
                      controller: searchController,
                      hintText: "Search Here",
                      keyboardType: TextInputType.text),
                ),

//
                verticalSpace(18.h),
                // Expanded(
                //   child: ConversationsView(
                //     searchBarHideText: "Search Here",
                //     backgroundWidget: Container(
                //       color: AppColors.kcWhiteColor,
                //     ),
                //     enableAppBar: false,
                //     enableSearchBar: false,
                //     itemBuilder: (context, model) {
                //       return ChatTileWidget(
                //         userName: model.showName,
                //         lastMessage: model.lastMessage!.bodyType ==
                //                 MessageType.IMAGE
                //             ? "Image"
                //             : model.lastMessage!.bodyType == MessageType.VIDEO
                //                 ? "Video"
                //                 : model.lastMessage!.bodyType ==
                //                         MessageType.FILE
                //                     ? "File"
                //                     : model.lastMessage!.bodyType ==
                //                             MessageType.VOICE
                //                         ? "Audio"
                //                         : model.lastMessage!.textContent,
                //         isRead: model.lastMessage!.hasReadAck,
                //         imageUrl: model.avatarUrl ?? faker.image.loremPicsum(),
                //         dateTime: DateTime.fromMillisecondsSinceEpoch(
                //             model.lastMessage!.serverTime),
                //       );
                //     },
                //     onItemTap: (context, info) {
                //       model.navigateToMessageView(info.profile.id);
                //     },
                //     appBarModel: ChatUIKitAppBarModel(
                //       bottomLine: false,
                //       backgroundColor: AppColors.kcWhiteColor,
                //       title: "Chats",
                //       showBackButton: false,
                //       centerTitle: true,
                //       leadingActions: [
                //         ChatUIKitAppBarAction(
                //           child: Padding(
                //             padding: const EdgeInsets.only(left: 0.0),
                //             child: SvgPicture.asset(AppIcons.filterIcon),
                //           ),
                //         )
                //       ],
                //       trailingActions: [
                //         ChatUIKitAppBarAction(
                //           onTap: (_) {
                //             model.showAddContactDialog();
                //           },
                //           child: Padding(
                //             padding: const EdgeInsets.only(right: 16.0),
                //             child: Icon(
                //               Icons.add,
                //               color: AppColors.kcPrimaryColor,
                //             ),
                //           ),
                //         )
                //       ],
                //       titleTextStyle: AppTextstyles.semiBold(
                //           color: AppColors.kcPrimaryColor, size: 22.sp),
                //     ),
                //   ),
                // )

                // const Expanded(child: ConversationsView())
              ],
            ),
          ),
        ),
      ).onTap(() {
        FocusScope.of(context).unfocus();
      }),
    );
  }
}

class ChatTileWidget extends StatelessWidget {
  final String userName;
  final String lastMessage;
  final bool isRead;
  final DateTime? dateTime;
  final String? imageUrl;

  const ChatTileWidget({
    super.key,
    required this.userName,
    required this.lastMessage,
    required this.isRead,
    this.dateTime,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: null,
          contentPadding:
              const EdgeInsets.only(left: 10, top: 10, right: 35, bottom: 0),
          leading: CircleAvatar(
            radius: 24.r,
            backgroundColor: AppColors.chatNoBgImageColor,
            backgroundImage: NetworkImage(imageUrl!),
          ),
          title: Text(
            userName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextstyles.mediumSemiBold.copyWith(fontSize: 15.95.sp),
          ),
          subtitle: Row(
            children: [
              isRead
                  ? SvgPicture.asset(
                      AppIcons.doubleTickIcon,
                      height: 17.h,
                    )
                  : Icon(
                      Icons.check,
                      color: AppColors.kcPrimaryColor,
                      size: 17.h,
                    ),
              Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  // strutStyle: const StrutStyle(fontSize: 12.0),
                  text: TextSpan(
                    children: [
                      // TextSpan(
                      //     text: " You: ",
                      //     style: AppTextstyles.semiBold(
                      //         color: AppColors.kcBlackColor, size: 12.sp)),
                      TextSpan(
                          text: " $lastMessage",
                          style: AppTextstyles.regular(
                              color: AppColors.kcBlackColor, size: 12.sp)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          trailing: Column(
            children: [
              Text(
                formatDate(dateTime!),
                style: AppTextstyles.small,
              ),
            ],
          ),
        ),
        Divider(
          height: 1.h,
          thickness: 0.5.h,
          indent: 70.w,
          endIndent: 30.w,
          color: AppColors.kcDividerColor,
        ),
        verticalSpace(10.h),
      ],
    );
  }
}

//format the date to AM or PM
String formatDate(DateTime date) {
  String formattedDate = '';
  if (date.hour < 12) {
    formattedDate = '${date.hour}:${date.minute} AM';
  } else if (date.hour == 12) {
    formattedDate = '${date.hour}:${date.minute} PM';
  } else {
    formattedDate = '${date.hour - 12}:${date.minute} PM';
  }
  return formattedDate;
}
