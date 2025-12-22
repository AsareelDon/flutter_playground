import 'package:auth_handling/src/core/error/failures.dart';
import 'package:auth_handling/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:auth_handling/src/features/auth/data/models/account_model.dart';

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {

  @override
  Future<AccountModel> login({required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 1));

    if (email == 'test@test.com' && password == '123456') {
      return AccountModel(
        id: '1',
        email: email,
        name: 'Test User',
        username: 'testUser123',
        password: '123456',
      );
    } else {
      throw InvalidInputFailure();
    }
  }

  @override
  Future<void> logout() async {
    await Future.delayed(Duration(milliseconds: 500));
  }
}

