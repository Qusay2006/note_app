import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:rivaan_project2/core/error/app_faliure.dart';
import 'package:rivaan_project2/core/usecases/use_cases.dart';
import 'package:rivaan_project2/core/common/entity/user_entity.dart';
import '../../data/repository/auth_repo_impl.dart';

@lazySingleton
class AuthCurrentUserUseCase implements UseCases<UserEntity,EmptyPrams>{
  final AuthRepo _repo;
  AuthCurrentUserUseCase({required this._repo});

  @override
  Future<Either<Failures, UserEntity>> call(EmptyPrams params) async{
  return await _repo.currentUser();
  }
}

class EmptyPrams {
}