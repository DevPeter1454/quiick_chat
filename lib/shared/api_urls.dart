class ApiUrls {
  static const String baseUrl =
      "http://ec2-54-172-213-134.compute-1.amazonaws.com/api/v1";

  static const String registerUrl = "/auth/register";
  static const String loginUrl = "/auth/login";
  static const String verifyLoginUrl = "/auth/verify-login";

  static const String resendOtpUrl = "/auth/resend-code";

  static const String verifyOtpUrl = "/auth/verify";

  static const String uploadProfilePhotoUrl = "/users/";

  static const String getAgoraTokenUrl = "/ac/user-token";

  static const String refreshTokenUrl = "/auth/refresh-token";

  static const String generateAgoraTokenUrl = "/ac/user-token";

  static const String getContactsUrl = "/chats/contacts";
  static const String getChatsUrl = "/chats";
  static const String getChatMessagesUrl = "/chats/";
  static const String getChatMessagesUrlWithLimit = "/chats/?limit=";
  static const String getChatMessagesUrlWithLimitAndOffset =
      "/chats/?limit=&offset=";

  static const String getChatCredInfo = '/users/chat-cred';
}
