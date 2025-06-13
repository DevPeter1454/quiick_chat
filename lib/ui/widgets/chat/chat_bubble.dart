import 'package:flutter/material.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:agora_chat_uikit/chat_uikit.dart';

class ChatBubble extends StatelessWidget {
  final String? message;
  final bool isSender;
  final DateTime timestamp;
  final bool isRead;
  final Widget? mediaContent; // Add this for media content
  final MessageType? messageType; // Add message type

  const ChatBubble({
    Key? key,
    this.message,
    required this.isSender,
    required this.timestamp,
    this.isRead = false,
    this.mediaContent, // Media content widget
    this.messageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: mediaContent != null
            ? const EdgeInsets.only(left: 8, top: 10, right: 12, bottom: 10)
            : const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSender
              ? AppColors.senderChatBubbleColor
              : AppColors.receiverChatBubbleColor,
          borderRadius: isSender
              ? const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Show media content if available
            if (mediaContent != null) mediaContent!,

            // Show text message if available
            if (message != null)
              Text(
                message!,
                style: TextStyle(
                  color: isSender ? Colors.white : Colors.black,
                ),
              ),

            // Timestamp and read status
            verticalSpace(10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isSender)
                  Icon(
                    isRead ? Icons.done_all : Icons.done,
                    size: 12,
                    color: isRead ? AppColors.kcPrimaryColor : Colors.white70,
                  ),
                if (isSender) const SizedBox(width: 4),
                Text(
                  _formatTime(timestamp),
                  style: AppTextstyles.regular(
                    size: 8.45.sp,
                    color: isSender ? const Color(0xFFB3B3B3) : Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return "${time.hour}:${time.minute.toString().padLeft(2, '0')}";
  }
}
