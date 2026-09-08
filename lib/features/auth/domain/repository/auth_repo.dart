import 'package:fpdart/fpdart.dart';
import 'package:rivaan_project2/core/error/app_faliure.dart';
import 'package:rivaan_project2/features/auth/data/model/user_model.dart';
import 'package:rivaan_project2/core/common/entity/user_entity.dart';

abstract interface class AuthRepo {
  Future<Either<Failures,UserEntity>> login({required String email, required String password});
  Future<Either<Failures,UserEntity>> signUp({required String name, required String email, required String password});
  Future<Either<Failures,UserEntity>>currentUser();

}