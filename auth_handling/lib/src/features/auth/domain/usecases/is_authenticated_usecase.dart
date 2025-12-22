import 'package:auth_handling/src/core/error/failures.dart';
import 'package:auth_handling/src/core/usecase/generic_usecase.dart';
import 'package:auth_handling/src/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class IsAuthenticatedUseCase implements GenericUseCase<bool, NoParams> {
  final AuthRepository repository;

  IsAuthenticatedUseCase({required this.repository});

  @override
  Future<Either<Failures, bool>> call(NoParams params) async {
    return await repository.isAuthenticated();
  }
}