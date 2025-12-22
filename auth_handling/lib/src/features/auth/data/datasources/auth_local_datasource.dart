import 'package:auth_handling/src/features/auth/data/models/account_model.dart';

abstract class AuthLocalDatasource {
  Future<void> cacheAccessToken(String token);
  Future<void> cacheRefreshToken(String token);

  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();

  Future<void> cacheUserAccount(AccountModel user);
  Future<AccountModel?> getCachedUserAccount();

  Future<void> clearAuthSessionData();
}
