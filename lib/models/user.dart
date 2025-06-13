import 'agora_chat_info.dart';

class User {
  final String id;
  final String email;
  final String username;
  final String phone;
  final String? profilePicture;
  final String? publicKey;
  final bool isVerified;
  final int lastSeenMillis; // Changed from DateTime to int milliseconds
  final String? status; // Made nullable
  final int createdAtMillis; // Changed from DateTime to int milliseconds
  final DateTime? updatedAt;
  final AgoraChatInfo? agoraChatInfo;

  // New fields from the provided JSON
  final String uuid;
  final String? typeField;
  final int created;
  final int modified;
  final bool activated;
  final String? nickname;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.phone,
    this.profilePicture,
    this.publicKey,
    required this.isVerified,
    required this.lastSeenMillis,
    this.status,
    required this.createdAtMillis,
    this.updatedAt,
    this.agoraChatInfo,
    required this.uuid,
    this.typeField,
    required this.created,
    required this.modified,
    required this.activated,
    this.nickname,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      phone: json['phone'],
      profilePicture: json['profile_picture'],
      publicKey: json['public_key'],
      isVerified: json['is_verified'],
      lastSeenMillis: json['last_seen_millis'],
      status: json['status'],
      createdAtMillis: json['created_at_millis'],
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      agoraChatInfo: json['agora_chat_info'] != null
          ? AgoraChatInfo.fromJson(json['agora_chat_info'])
          : null,
      uuid: json['uuid'],
      typeField: json['type_field'],
      created: json['created'],
      modified: json['modified'],
      activated: json['activated'],
      nickname: json['nickname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'phone': phone,
      'profile_picture': profilePicture,
      'public_key': publicKey,
      'is_verified': isVerified,
      'last_seen_millis': lastSeenMillis,
      'status': status,
      'created_at_millis': createdAtMillis,
      'updated_at': updatedAt?.toIso8601String(),
      'agora_chat_info': agoraChatInfo?.toJson(),
      'uuid': uuid,
      'type_field': typeField,
      'created': created,
      'modified': modified,
      'activated': activated,
      'nickname': nickname,
    };
  }
}
