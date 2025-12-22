import 'package:auth_handling/src/features/auth/data/models/account_model.dart';

abstract class AuthRemoteDatasource {
  Future<AccountModel> login({required String email, required String password});
  Future<void> logout();
}