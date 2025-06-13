import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

const Color kcPrimaryColor = Color(0xFF9600FF);
const Color kcPrimaryColorDark = Color(0xFF300151);
const Color kcDarkGreyColor = Color(0xFF1A1B1E);
const Color kcMediumGrey = Color(0xFF474A54);
const Color kcLightGrey = Color.fromARGB(255, 187, 187, 187);
const Color kcVeryLightGrey = Color(0xFFE3E3E3);
const Color kcBackgroundColor = kcDarkGreyColor;

class AppColors {
  AppColors._();

  static final Color kcWhiteColor = HexColor('#FFFFFF');
  static final Color kcBlackColor = HexColor('#000000');
  static final Color kcPrimaryColor = HexColor('#00B456');
  static final Color kcDotIndicatorColor = HexColor('#D9D9D9');

  static Color kcButtonDisabledColor = HexColor('#00B456').withAlpha(80);
  static const Color errorColor = Color(0xFFD42620);

  static const Color kcInputBorderColor = Color(0xFFACB1C6);
  static const Color chatNoBgImageColor = Color(0xFF25303D);
  static const Color kcDividerColor = Color(0xFFDBDBDB);

  static const Color senderChatBubbleColor = Color(0xFF25303D);
  static const Color receiverChatBubbleColor = Color(0xFFFFFFFF);
}
