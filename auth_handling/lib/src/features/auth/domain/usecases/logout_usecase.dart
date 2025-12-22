import 'package:auth_handling/src/core/usecase/generic_usecase.dart';
import 'package:auth_handling/src/core/error/failures.dart';
import 'package:auth_handling/src/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase implements GenericUseCase<void, NoParams> {
  final AuthRepository repository;

  LogoutUseCase({required this.repository});

  @override
  Future<Either<Failures, void>> call(NoParams params) async {
    return await repository.logout();
  }
}