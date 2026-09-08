import 'package:fpdart/src/either.dart';
import 'package:rivaan_project2/core/error/app_exeption.dart';
import 'package:rivaan_project2/core/error/app_faliure.dart';
import 'package:rivaan_project2/core/network/connection_checker.dart';
import 'package:rivaan_project2/features/auth/data/datasource/auth_remote_data.dart';
import 'package:rivaan_project2/core/common/entity/user_entity.dart';
import 'package:rivaan_project2/features/auth/data/model/user_model.dart';
import 'package:rivaan_project2/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteData _authRemoteData;
  final ConnectionChecker _connectionChecker;


  AuthRepoImpl({required this._authRemoteData, required this._connectionChecker});

  @override
  Future<Either<Failures, UserEntity>> login({required String email, required String password})async {
    try {
      if (!await(_connectionChecker.isConnected)) {
        return Left(Failures("no Internet Connection"));
      }
        final user = await _authRemoteData.login(
          email: email, password: password);
        return Right(user);

    }on AppException catch(e){
      return Left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signUp(
      {required String name, required String email, required String password}) async {
    try {
      if (!await(_connectionChecker.isConnected)) {
        return Left(Failures("no Internet Connection"));
      }
      final userId = await _authRemoteData.signup(
          name: name.toString(), email: email, password: password);
      return Right(userId);
    } on AppException catch (e) {
      return Left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> currentUser() async{
    try{
      if (!await(_connectionChecker.isConnected)) {
        final session = _authRemoteData.currentUserState!;
        return (Right(UserModel(id: session.user.id, name: '', email: session.user.email??'')));
      }
       final currentUser = await _authRemoteData.getCurrentUserData();
       if(currentUser == null){
         return Left(Failures('User not logged in'));
       }
       return Right(currentUser);
    }on AppException catch(e)
    {
      return Left(Failures(e.message));
    }
  }
}