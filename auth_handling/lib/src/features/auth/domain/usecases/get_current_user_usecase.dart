import 'package:auth_handling/src/core/error/failures.dart';
import 'package:auth_handling/src/core/usecase/generic_usecase.dart';
import 'package:auth_handling/src/features/auth/domain/entity/account_entity.dart';
import 'package:auth_handling/src/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GetCurrentUserUseCase implements GenericUseCase<AccountEntity?, NoParams> {
  final AuthRepository repository;

  GetCurrentUserUseCase({required this.repository});

  @override
  Future<Either<Failures, AccountEntity?>> call(NoParams params) async {
    return await repository.getCurrentUser();
  }
}