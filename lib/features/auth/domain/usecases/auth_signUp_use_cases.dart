import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:rivaan_project2/core/error/app_faliure.dart';
import 'package:rivaan_project2/core/usecases/use_cases.dart';
import 'package:rivaan_project2/core/common/entity/user_entity.dart';
import 'package:rivaan_project2/features/auth/domain/repository/auth_repo.dart';

@lazySingleton
class AuthSignupUseCases implements UseCases<UserEntity,UserSignUpPrams>{
  final AuthRepo _repo ;
  AuthSignupUseCases({required this._repo});

  @override
  Future<Either<Failures, UserEntity>> call(UserSignUpPrams prams) async {
    return await _repo.signUp(name: prams.name.toString(), email: prams.email, password: prams.password);
  }
}


class UserSignUpPrams{
  final String name;
  final String email;
  final String password;

  UserSignUpPrams({required this.name, required this.email, required this.password});
}