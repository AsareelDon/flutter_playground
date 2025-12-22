import 'package:auth_handling/src/core/error/failures.dart';
import 'package:auth_handling/src/core/usecase/generic_usecase.dart';
import 'package:auth_handling/src/features/auth/domain/entity/account_entity.dart';
import 'package:auth_handling/src/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoginUseCase implements GenericUseCase<AccountEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failures, AccountEntity>> call(params) async {
    return await repository.login(email: params.email, password: params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
