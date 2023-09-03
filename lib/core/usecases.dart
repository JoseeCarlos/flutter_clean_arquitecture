import 'package:dartz/dartz.dart';
import 'package:example_project_api/core/failures.dart';

abstract class UsesCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

abstract class FutureUsesCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class StreamUsesCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}

class NoParams {}
