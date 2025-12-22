import 'package:auth_handling/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class GenericUseCase<Type, Params> {
  Future<Either<Failures, Type>> call(Params params);
}

class NoParams {}