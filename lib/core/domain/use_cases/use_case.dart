import 'package:dartz/dartz.dart';
import 'package:test_task_hp_houses/core/domain/entities/failure.dart';

abstract class UseCase<Result, Params> {
  Future<Either<Failure, Result>> call(Params params);
}
