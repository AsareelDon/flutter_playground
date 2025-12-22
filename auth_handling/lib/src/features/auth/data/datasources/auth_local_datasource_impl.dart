import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'auth_local_datasource.dart';
import '../models/account_model.dart';

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final FlutterSecureStorage secureStorage;

  static const _accessTokenKey = 'ACCESS_TOKEN';
  static const _refreshTokenKey = 'REFRESH_TOKEN';
  static const _userKey = 'CACHED_USER';

  AuthLocalDatasourceImpl({required this.secureStorage});

  @override
  Future<void> cacheAccessToken(String token) async {
    await secureStorage.write(key: _accessTokenKey, value: token);
  }

  @override
  Future<void> cacheRefreshToken(String token) async {
    await secureStorage.write(key: _refreshTokenKey, value: token);
  }

  @override
  Future<String?> getAccessToken() async {
    return secureStorage.read(key: _accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return secureStorage.read(key: _refreshTokenKey);
  }

  @override
  Future<void> cacheUserAccount(AccountModel user) async {
    await secureStorage.write(
      key: _userKey,
      value: jsonEncode(user.toJson()),
    );
  }

  @override
  Future<AccountModel?> getCachedUserAccount() async {
    final jsonString = await secureStorage.read(key: _userKey);
    if (jsonString == null) return null;

    return AccountModel.fromJson(jsonDecode(jsonString));
  }

  @override
  Future<void> clearAuthSessionData() async {
    await secureStorage.deleteAll();
  }
}
