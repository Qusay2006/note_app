import 'package:fpdart/fpdart.dart';
import 'package:rivaan_project2/core/error/app_faliure.dart';

abstract interface class UseCases<T,Params> {
  Future<Either<Failures,T>>call(Params params);
}