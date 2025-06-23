import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiick_chat/app/app.logger.dart';
import 'package:quiick_chat/models/user.dart';
import 'package:stacked/stacked_annotations.dart';

class LocalStorageService implements InitializableDependency {
  static const String _accessTokenKey = 'access_token';
  static const String _agoraTokenKey = 'agora_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userKey = 'user_data';
  static const String _saveColorsKey = 'saved_colors';
  static const String _chatColorKey = 'chat_color';

  final _log = getLogger('LocalStorageService');
  late SharedPreferences _prefs;

  // Implementation of InitializableService
  @override
  Future<void> init() async {
    _log.i('Initializing LocalStorageService');
    _prefs = await SharedPreferences.getInstance();
    _log.i('LocalStorageService initialized successfully');
  }

  // Token management
  Future<bool> saveAccessToken(String token) async {
    _log.i('Saving access token $token');
    return await _prefs.setString(_accessTokenKey, token);
  }

  Future<bool> saveRefreshToken(String token) async {
    _log.i('Saving refresh token');
    return await _prefs.setString(_refreshTokenKey, token);
  }

  Future<bool> saveAgoraToken(String token) async {
    _log.i('Saving agora token');
    return await _prefs.setString(_agoraTokenKey, token);
  }

///// method handling saving colors to storage.........................................
  Future<bool> saveColorList(List<String> token) async {
    _log.i('Saving color');
    return await _prefs.setStringList(_saveColorsKey, token);
  }

  List<String>? getColorList() {
    final token = _prefs.getStringList(_saveColorsKey);
    _log.i('Retrieved access token: ${token ?? 'null'}');
    return token;
  }

///// method handling creating chat and saving color to storage.........................................
  Future<bool> saveChatColorToken(String token) async {
    _log.i('Saving chat color token $token');
    return await _prefs.setString(_chatColorKey, token);
  }

  String? getChatColorToken() {
    final token = _prefs.getString(_chatColorKey);
    _log.i('Retrieved chat color token: ${token != null ? 'exists' : 'null'}');
    return token;
  }

/////////////////.....................................................................
  String? getAccessToken() {
    final token = _prefs.getString(_accessTokenKey);
    _log.i('Retrieved access token: ${token ?? 'null'}');
    return token;
  }

  String? getRefreshToken() {
    final token = _prefs.getString(_refreshTokenKey);
    _log.i('Retrieved refresh token: ${token != null ? 'exists' : 'null'}');
    return token;
  }

  String? getAgoraToken() {
    final token = _prefs.getString(_agoraTokenKey);
    _log.i('Retrieved agora token: ${token != null ? 'exists' : 'null'}');
    return token;
  }

  Future<bool> clearTokens() async {
    _log.i('Clearing tokens');
    await _prefs.remove(_accessTokenKey);
    return await _prefs.remove(_refreshTokenKey);
  }

  // Check if user is logged in
  bool isUserLoggedIn() {
    final hasToken = getAccessToken() != null;
    _log.i('User logged in: $hasToken');
    return hasToken;
  }

  // User data management
  Future<bool> saveUser(User user) async {
    _log.i('Saving user data for: ${user.username}');
    return await _prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  User? getUser() {
    final userJson = _prefs.getString(_userKey);
    if (userJson == null) {
      _log.i('No user data found');
      return null;
    }

    try {
      _log.i('Retrieved user data');
      return User.fromJson(jsonDecode(userJson));
    } catch (e) {
      _log.e('Error parsing user data: $e');
      return null;
    }
  }

  Future<bool> clearUser() async {
    _log.i('Clearing user data');
    return await _prefs.remove(_userKey);
  }

  // Complete logout
  Future<bool> logout() async {
    _log.i('Performing complete logout');
    await clearUser();
    return await clearTokens();
  }

  // Generic methods for storing other data
  Future<bool> saveString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> saveInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  Future<bool> saveBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<bool> removeItem(String key) async {
    return await _prefs.remove(key);
  }

  Future<bool> clearAll() async {
    return await _prefs.clear();
  }
}
