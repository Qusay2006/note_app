import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rivaan_project2/core/common/cubit/app_user_cubit.dart';
import 'package:rivaan_project2/core/network/connection_checker.dart';
import 'package:rivaan_project2/features/auth/data/repository/auth_repo_impl.dart';
import 'package:rivaan_project2/features/auth/data/datasource/auth_remote_data.dart';
import 'package:rivaan_project2/features/auth/domain/repository/auth_repo.dart';
import 'package:rivaan_project2/features/auth/domain/usecases/auth_current_user_use_case.dart';
import 'package:rivaan_project2/features/auth/domain/usecases/auth_login_use_case.dart';
import 'package:rivaan_project2/features/auth/domain/usecases/auth_signUp_use_cases.dart';
import 'package:rivaan_project2/features/auth/presintation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final slAuth = GetIt.instance;

void authGetIT() {
  slAuth.registerLazySingleton(() => Supabase.instance.client);
  slAuth.registerLazySingleton(() => InternetConnection());


  slAuth.registerFactory<ConnectionChecker>(
        () => ConnectionCheckerImpl(internetConnection: slAuth()),);
  slAuth.registerLazySingleton<AuthRemoteData>(
        () => AuthRemoteDataImpl(supabaseClient: slAuth()),);
  slAuth.registerLazySingleton<AuthRepo>(
        () => AuthRepoImpl(authRemoteData: slAuth(), connectionChecker: slAuth()),);
  slAuth.registerLazySingleton(() => AuthSignupUseCases(repo: slAuth()));
  slAuth.registerLazySingleton(() => AuthLoginUseCase(repo: slAuth()));
  slAuth.registerLazySingleton(() => AuthCurrentUserUseCase(repo: slAuth()));
  slAuth.registerLazySingleton(() => AppUserCubit());
  slAuth.registerFactory(
        () => AuthBloc(
      signInUserCase: slAuth(),
      loginUseCase: slAuth(),
      currentUseCase: slAuth(),
      userCubit: slAuth(),
    ),
  );
}