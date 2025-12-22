import 'package:auth_handling/src/core/error/failures.dart';
import 'package:auth_handling/src/features/auth/domain/entity/account_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
    Future<Either<Failures, AccountEntity>> login({
      required String email,
      required String password,
    });

    Future<Either<Failures, void>> logout();

    Future<Either<Failures, AccountEntity?>> getCurrentUser();

    Future<Either<Failures, bool>> isAuthenticated();
}