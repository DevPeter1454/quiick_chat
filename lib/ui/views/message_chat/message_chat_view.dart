// import 'package:agora_chat_uikit/chat_uikit.dart';

import 'package:faker/faker.dart' as Faker;
import 'package:flutter/material.dart';
// import 'package:quiick_chat/ui/common/export.dart';
import 'package:stacked/stacked.dart';

import 'message_chat_viewmodel.dart';

class MessageChatView extends StackedView<MessageChatViewModel> {
  final String userId;
  const MessageChatView(this.userId, {super.key});

  @override
  Widget builder(
    BuildContext context,
    MessageChatViewModel viewModel,
    Widget? child,
  ) {
    // ChatUIKitProfile profile = ChatUIKitProfile(
    //   id: userId,
    //   showName: "User random",
    //   type: ChatUIKitProfileType.contact,
    //   // avatarUrl:
    // );
    // MessagesViewController controller = MessagesViewController(
    //   profile: profile,
    // );
    Faker.Faker faker = Faker.Faker();
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Text("Chat body"),
        )
        // MessagesView(
        //   onItemTap: (context, model, rect) {
        //     return true;
        //   },

        //   replyBarBuilder: (context, replyMessage) {
        //     return ChatUIKitReplyBar(
        //       onCancelTap: () {
        //         debugPrint("Cancel reply tapped");
        //         // Call the original cancel tap handler
        //         replyMessage;
        //       },
        //       messageModel: replyMessage,
        //       title: const Text("Reply"),
        //       subTitle: Text(replyMessage.message.textContent),
        //     );
        //   },
        // bubbleBuilder: (context, child, model) {
        //   final isSender = model.message.from != userId;
        //   final timestamp =
        //       DateTime.fromMillisecondsSinceEpoch(model.message.serverTime);
        //   final isRead = model.message.hasReadAck;

        //   // Handle different message types
        //   switch (model.message.bodyType) {
        //     case MessageType.TXT:
        //       final message = model.message.textContent;
        //       return ChatBubble(
        //         message: message,
        //         isSender: isSender,
        //         timestamp: timestamp,
        //         isRead: isRead,
        //         messageType: MessageType.TXT,
        //       ).onTap(() {
        //         debugPrint("Text message tapped: $message");
        //       });

        //     case MessageType.IMAGE:
        //       // Handle image messages
        //       return ChatBubble(
        //         isSender: isSender,
        //         timestamp: timestamp,
        //         isRead: isRead,
        //         messageType: MessageType.IMAGE,
        //         mediaContent: Image.network(
        //           model.message.remotePath ?? '',
        //           width: 200,
        //           height: 200,
        //           fit: BoxFit.fill,
        //           loadingBuilder: (context, child, loadingProgress) {
        //             if (loadingProgress == null) return child;
        //             return Center(
        //               child: CircularProgressIndicator(
        //                 value: loadingProgress.expectedTotalBytes != null
        //                     ? loadingProgress.cumulativeBytesLoaded /
        //                         loadingProgress.expectedTotalBytes!
        //                     : null,
        //               ),
        //             );
        //           },
        //           errorBuilder: (context, error, stackTrace) {
        //             return Container(
        //               width: 200,
        //               height: 150,
        //               color: Colors.grey[300],
        //               child: const Icon(Icons.broken_image, size: 50),
        //             );
        //           },
        //         ),
        //       );

        //     case MessageType.VIDEO:
        //       // Handle video messages
        //       return ChatBubble(
        //         isSender: isSender,
        //         timestamp: timestamp,
        //         isRead: isRead,
        //         messageType: MessageType.VIDEO,
        //         mediaContent: Stack(
        //           alignment: Alignment.center,
        //           children: [
        //             Image.network(
        //               model.message.remotePath ?? '',
        //               width: 200,
        //               height: 150,
        //               fit: BoxFit.cover,
        //             ),
        //             const Icon(
        //               Icons.play_circle_fill,
        //               size: 50,
        //               color: Colors.white,
        //             ),
        //           ],
        //         ),
        //       );

        //     case MessageType.FILE:
        //       // Handle file messages
        //       return ChatBubble(
        //         message: "File: ${model.message.remotePath ?? 'Unknown file'}",
        //         isSender: isSender,
        //         timestamp: timestamp,
        //         isRead: isRead,
        //         messageType: MessageType.FILE,
        //         mediaContent: Container(
        //           padding: const EdgeInsets.all(8),
        //           decoration: BoxDecoration(
        //             color: Colors.grey[100],
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           child: Row(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               const Icon(Icons.insert_drive_file),
        //               const SizedBox(width: 8),
        //               Flexible(
        //                 child: Text(
        //                   model.message.remotePath ?? 'Unknown file',
        //                   overflow: TextOverflow.ellipsis,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ).onTap(() {
        //         viewModel.handleFileMessage(model.message);
        //       });

        //     case MessageType.VOICE:
        //       return ChatBubble(
        //         isSender: isSender,
        //         timestamp: timestamp,
        //         isRead: isRead,
        //         messageType: MessageType.VOICE,
        //         mediaContent: VoiceMessagePlayer(
        //           audioUrl: model.message.remotePath ?? '',
        //           isSender: isSender,
        //         ),
        //       );

        //     default:
        //       return ChatBubble(
        //         message: "Unknown message type",
        //         isSender: isSender,
        //         timestamp: timestamp,
        //         isRead: isRead,
        //         messageType: MessageType.TXT,
        //       );
        //   }
        // },

        // bubbleContentBuilder: (context, model) {
        //   return Container(
        //     padding: const EdgeInsets.all(8),
        //     child: Text(
        //       model.message.textContent,
        //       style: const TextStyle(color: Colors.white),
        //     ),
        //   );
        // },

        // onItemLongPressHandler: (context, model, rect, defaultActions) {
        //   // Create a list to hold our custom actions
        //   List<ChatUIKitEventAction> customActions = [];

        //   // Loop through all default actions and customize them as needed
        //   for (var action in defaultActions) {
        //     // Determine the proper label based on action type
        //     String actionLabel;
        //     switch (action.actionType) {
        //       case ChatUIKitActionType.forward:
        //         actionLabel = 'Forward';
        //         break;
        //       case ChatUIKitActionType.reply:
        //         actionLabel = 'Reply';
        //         break;
        //       case ChatUIKitActionType.delete:
        //         actionLabel = 'Delete';
        //         break;
        //       case ChatUIKitActionType.report:
        //         actionLabel = 'Report';
        //         break;
        //       case ChatUIKitActionType.recall:
        //         actionLabel = 'Recall';
        //         break;
        //       case ChatUIKitActionType.copy:
        //         actionLabel = 'Copy';
        //         break;
        //       case ChatUIKitActionType.multiSelect:
        //         actionLabel = 'Select';
        //         break;
        //       default:
        //         actionLabel = action.label ?? 'Action';
        //         break;
        //     }

        //     // Create a custom version of each action with proper label
        //     customActions.add(
        //       ChatUIKitEventAction(
        //         actionType: action.actionType,
        //         onTap: () {
        //           debugPrint("$actionLabel message action tapped");
        //           // Call the original action's onTap handler
        //           action.onTap?.call();
        //         },
        //         type: action.type,
        //         label: actionLabel,
        //       ),
        //     );
        //   }

        //   return customActions;
        // },
        // appBarModel: ChatUIKitAppBarModel(
        //     showBackButton: false,
        //     // title: "User ",
        //     bottomLine: false,
        //     centerWidget: Row(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         horizontalSpace(18),
        //         CircleAvatar(
        //           radius: 18,
        //           backgroundImage: NetworkImage(
        //             faker.image.loremPicsum(),
        //           ),
        //         ),
        //         horizontalSpace(13),
        //         Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               "User random",
        //               style: AppTextstyles.mediumBold,
        //             ),
        //             Text(
        //               "Last active:x",
        //               style: AppTextstyles.regular(
        //                   size: 8, color: const Color(0xFF5E5F60)),
        //             ),
        //           ],
        //         )
        //       ],
        //     ),
        //     leadingActions: [
        //       ChatUIKitAppBarAction(
        //         child: Padding(
        //           padding: const EdgeInsets.only(left: 27.0),
        //           child: Icon(
        //             Icons.arrow_back_ios,
        //             size: 18,
        //             color: AppColors.kcPrimaryColor,
        //           ),
        //         ),
        //         onTap: (context) => viewModel.back(),
        //       ),
        //     ]),
        // showMessageItemNickname: (model) {
        //   return false;
        // },
        // backgroundWidget: Image.asset(
        //   AppImages.chatBackdrop,
        //   height: screenHeight(context),
        //   fit: BoxFit.fill,
        // ),
        // showMessageItemAvatar: (model) => false,
        // profile: profile,
        // controller: controller,

        // itemBuilder: (context, model) {
        //   final isSender = model.message.from != userId;
        //   final timestamp =
        //       DateTime.fromMillisecondsSinceEpoch(model.message.serverTime);
        //   final isRead = model.message.hasReadAck;

        //   // Handle different message types
        //   switch (model.message.bodyType) {
        //     case MessageType.TXT:
        //       final message = model.message.textContent;
        //       return ChatBubble(
        //         message: message,
        //         isSender: isSender,
        //         timestamp: timestamp,
        //         isRead: isRead,
        //         messageType: MessageType.TXT,
        //       ).onTap(() {
        //         debugPrint("Text message tapped: $message");
        //       });

        //     case MessageType.IMAGE:
        //       // Handle image messages
        //       return ChatBubble(
        //         isSender: isSender,
        //         timestamp: timestamp,
        //         isRead: isRead,
        //         messageType: MessageType.IMAGE,
        //         mediaContent: Image.network(
        //           model.message.remotePath ?? '',
        //           width: 200,
        //           height: 200,
        //           fit: BoxFit.fill,
        //           loadingBuilder: (context, child, loadingProgress) {
        //             if (loadingProgress == null) return child;
        //             return Center(
        //               child: CircularProgressIndicator(
        //                 value: loadingProgress.expectedTotalBytes != null
        //                     ? loadingProgress.cumulativeBytesLoaded /
        //                         loadingProgress.expectedTotalBytes!
        //                     : null,
        //               ),
        //             );
        //           },
        //           errorBuilder: (context, error, stackTrace) {
        //             return Container(
        //               width: 200,
        //               height: 150,
        //               color: Colors.grey[300],
        //               child: const Icon(Icons.broken_image, size: 50),
        //             );
        //           },
        //         ),
        //       );

        //     case MessageType.VIDEO:
        //       // Handle video messages
        //       return ChatBubble(
        //         isSender: isSender,
        //         timestamp: timestamp,
        //         isRead: isRead,
        //         messageType: MessageType.VIDEO,
        //         mediaContent: Stack(
        //           alignment: Alignment.center,
        //           children: [
        //             Image.network(
        //               model.message.remotePath ?? '',
        //               width: 200,
        //               height: 150,
        //               fit: BoxFit.cover,
        //             ),
        //             const Icon(
        //               Icons.play_circle_fill,
        //               size: 50,
        //               color: Colors.white,
        //             ),
        //           ],
        //         ),
        //       );

        //     case MessageType.FILE:
        //       // Handle file messages
        //       return ChatBubble(
        //         message: "File: ${model.message.remotePath ?? 'Unknown file'}",
        //         isSender: isSender,
        //         timestamp: timestamp,
        //         isRead: isRead,
        //         messageType: MessageType.FILE,
        //         mediaContent: Container(
        //           padding: const EdgeInsets.all(8),
        //           decoration: BoxDecoration(
        //             color: Colors.grey[100],
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           child: Row(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               const Icon(Icons.insert_drive_file),
        //               const SizedBox(width: 8),
        //               Flexible(
        //                 child: Text(
        //                   model.message.remotePath ?? 'Unknown file',
        //                   overflow: TextOverflow.ellipsis,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ).onTap(() {
        //         viewModel.handleFileMessage(model.message);
        //       });

        //     case MessageType.VOICE:
        //       return ChatBubble(
        //         isSender: isSender,
        //         timestamp: timestamp,
        //         isRead: isRead,
        //         messageType: MessageType.VOICE,
        //         mediaContent: VoiceMessagePlayer(
        //           audioUrl: model.message.remotePath ?? '',
        //           isSender: isSender,
        //         ),
        //       );

        //     default:
        //       // Fall back to default for other message types
        //       return null;
        //   }
        // },
        // onItemTap: (context, model, rect) {
        //   // Stop any playing audio if tapping on a message
        //   viewModel.stopAudio();

        //   // Handle different message types
        //   switch (model.message.body.type) {
        //     case MessageType.TXT:
        //       // Handle text message tap
        //       debugPrint("Text message tapped: ${model.message.body}");
        //       break;
        //     case MessageType.IMAGE:
        //       // Open image viewer
        //       viewModel.viewImage(model.message);
        //       break;
        //     case MessageType.VOICE:
        //       // Play/pause voice message
        //       viewModel.playVoiceMessage(model.message);
        //       break;
        //     case MessageType.VIDEO:
        //       // Play video
        //       viewModel.playVideo(model.message);
        //       break;
        //     case MessageType.FILE:
        //       // Download or open file
        //       viewModel.handleFileMessage(model.message);
        //       break;
        //     case MessageType.LOCATION:
        //       // Open location on map
        //       viewModel.openLocation(model.message);
        //       break;
        //     default:
        //       debugPrint("Tapped on message type: ${model.message.body.type}");
        //   }

        //   return true; // Return true to indicate we've handled the tap
        // },
        // ),
        );
  }

  @override
  MessageChatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MessageChatViewModel();
}

// ChatUIKitPopupMenuController? popupMenuController;
