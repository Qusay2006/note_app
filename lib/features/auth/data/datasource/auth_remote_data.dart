import 'package:rivaan_project2/core/error/app_exeption.dart';
import 'package:rivaan_project2/features/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteData {
  Future<UserModel> login({required String email,required String password});
  Future<UserModel> signup({required String name,required String email,required String password});
  Future<UserModel?> getCurrentUserData()  ;
  Session? get currentUserState;
}


class AuthRemoteDataImpl implements AuthRemoteData {
  final SupabaseClient supabaseClient;
  AuthRemoteDataImpl({required this.supabaseClient});

  @override
  Session? get currentUserState => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    try {
      final result = await supabaseClient.auth.signInWithPassword(
          password: password, email: email);
      if (result.user == null) {
        throw const AppException('account is not registered');
      }
      return UserModel.fromJson(result.user!.toJson());
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  @override
  Future<UserModel> signup(
      {required String name, required String email, required String password}) async {
    try {
      final result = await supabaseClient.auth.signUp(
          password: password, email: email, data: {'name': name});
      if (result.user == null) {
        throw const AppException('User is null');
      }
      return UserModel.fromJson(result.user!.toJson());
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
     final isLogedIn = await supabaseClient.from('profiles').select().eq(
          'id',
          currentUserState!.user.id);
     return UserModel.fromJson(isLogedIn.first);
    }catch (e){
      throw AppException(e.toString());
    }
  }
}