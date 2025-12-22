import 'package:auth_handling/src/core/error/failures.dart';
import 'package:auth_handling/src/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:auth_handling/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:auth_handling/src/features/auth/data/models/account_model.dart';
import 'package:auth_handling/src/features/auth/domain/entity/account_entity.dart';
import 'package:auth_handling/src/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDataSource;
  final AuthLocalDatasource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failures, AccountEntity?>> getCurrentUser() async {
    try {
      final accountModel = await localDataSource.getCachedUserAccount();
      if (accountModel != null) {
        return Right(accountModel);
      } else {
        return const Right(null);
      }
    } on CacheFailure {
      return Left(CacheFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures, bool>> isAuthenticated() async {
    try {
      final accessToken = await localDataSource.getAccessToken();
      if (accessToken != null) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } on CacheFailure {
      return Left(CacheFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures, AccountEntity>> login({required String email, required String password}) async {
    try {
      final AccountModel accountModel = await remoteDataSource.login(email: email, password: password);
      await localDataSource.cacheUserAccount(accountModel);
      await localDataSource.cacheAccessToken("mock_session_token");
      await localDataSource.cacheRefreshToken("mock_session_refresh_token");
      return Right(accountModel);

    } on InvalidInputFailure {
      return Left(InvalidInputFailure());
    } on ServerFailure {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures, void>> logout() async {
    try {
      await localDataSource.clearAuthSessionData();
      return const Right(null);
    } on CacheFailure {
      return Left(CacheFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}