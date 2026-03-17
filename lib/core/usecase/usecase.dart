import 'package:dartz/dartz.dart';
import 'package:rick_and_morti/core/error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
