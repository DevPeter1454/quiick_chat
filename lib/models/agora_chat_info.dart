class AgoraChatInfo {
  final String username;
  final String uuid;
  final String? password;
  final String? typeField;
  final int created;
  final int modified;
  final bool activated;
  final String? nickname;

  AgoraChatInfo({
    required this.username,
    required this.uuid,
    this.password,
    this.typeField,
    required this.created,
    required this.modified,
    required this.activated,
    this.nickname,
  });

  factory AgoraChatInfo.fromJson(Map<String, dynamic> json) {
    return AgoraChatInfo(
      username: json['username'],
      uuid: json['uuid'],
      password: json['password'],
      typeField: json['type_field'],
      created: json['created'],
      modified: json['modified'],
      activated: json['activated'],
      nickname: json['nickname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'uuid': uuid,
      'password': password,
      'type_field': typeField,
      'created': created,
      'modified': modified,
      'activated': activated,
      'nickname': nickname,
    };
  }
}
