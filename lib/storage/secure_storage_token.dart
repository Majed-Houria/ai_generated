import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:developer' as developer;

class SecureStorageToken {
  static final SecureStorageToken _instance = SecureStorageToken._internal();
  factory SecureStorageToken() => _instance;

  SecureStorageToken._internal();

  static const _tokenKey = 'token';

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveTokens({
    required String token,
  }) async {
    try {
      await _storage.write(key: _tokenKey, value: token);
      developer.log('Tokens saved successfully.', name: 'SecureStorageToken');
    } catch (e) {
      developer.log(
        'Error saving tokens: $e',
        name: 'SecureStorageToken',
        error: e,
      );
    }
  }

  Future<String?> getToken() async {
    try {
      final token = await _storage.read(key: _tokenKey);
      return token;
    } catch (e) {
      developer.log(
        'Error reading Token: $e',
        name: 'SecureStorageToken',
        error: e,
      );
      return null;
    }
  }

  Future<void> clearTokens() async {
    try {
      await _storage.deleteAll();

      developer.log('All tokens cleared.', name: 'SecureStorageToken');
    } catch (e) {
      developer.log(
        'Error clearing tokens: $e',
        name: 'SecureStorageToken',
        error: e,
      );
    }
  }
}