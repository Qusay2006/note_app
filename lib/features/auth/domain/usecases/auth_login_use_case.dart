import 'package:fpdart/src/either.dart';
import 'package:rivaan_project2/core/error/app_faliure.dart';
import 'package:rivaan_project2/core/usecases/use_cases.dart';
import 'package:rivaan_project2/core/common/entity/user_entity.dart';
import 'package:rivaan_project2/features/auth/domain/repository/auth_repo.dart';

class AuthLoginUseCase implements UseCases<UserEntity,UserLogInPrams>{
  final AuthRepo _repo;
  AuthLoginUseCase({required this._repo});

  @override
  Future<Either<Failures, UserEntity>> call(UserLogInPrams userLogInPrams) async{
return await _repo.login(email: userLogInPrams.email, password: userLogInPrams.password);
  }
}

class UserLogInPrams{
  final String email ;
  final String password ;

  UserLogInPrams({required this.email, required this.password});
}