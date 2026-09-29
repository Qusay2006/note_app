// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:rivaan_project2/core/common/cubit/app_user_cubit.dart' as _i390;
import 'package:rivaan_project2/core/injection/register_module.dart' as _i13;
import 'package:rivaan_project2/core/network/connection_checker.dart' as _i70;
import 'package:rivaan_project2/core/network/Interceptor.dart' as _i639;
import 'package:rivaan_project2/features/auth/data/datasource/localdata/auth_local_data.dart'
    as _i566;
import 'package:rivaan_project2/features/auth/data/datasource/remote/auth_remote_data.dart'
    as _i260;
import 'package:rivaan_project2/features/auth/data/repository/auth_repo_impl.dart'
    as _i180;
import 'package:rivaan_project2/features/auth/domain/repository/auth_repo.dart'
    as _i719;
import 'package:rivaan_project2/features/auth/domain/usecases/auth_current_user_use_case.dart'
    as _i706;
import 'package:rivaan_project2/features/auth/domain/usecases/auth_login_use_case.dart'
    as _i198;
import 'package:rivaan_project2/features/auth/domain/usecases/auth_signUp_use_cases.dart'
    as _i1;
import 'package:rivaan_project2/features/auth/presintation/bloc/auth_bloc.dart'
    as _i1019;
import 'package:rivaan_project2/features/blog/data/datasource/locaData/blog_local_data_source.dart'
    as _i311;
import 'package:rivaan_project2/features/blog/data/datasource/remoteData/blog_remote_data.dart'
    as _i703;
import 'package:rivaan_project2/features/blog/data/datasource/remoteData/quote_api_service.dart'
    as _i309;
import 'package:rivaan_project2/features/blog/data/datasource/remoteData/quote_remote_data.dart'
    as _i412;
import 'package:rivaan_project2/features/blog/data/repositry/blog_repo_impl.dart'
    as _i867;
import 'package:rivaan_project2/features/blog/data/repositry/quote_repo_impl.dart'
    as _i968;
import 'package:rivaan_project2/features/blog/domain/repo/blog_repo.dart'
    as _i686;
import 'package:rivaan_project2/features/blog/domain/repo/quote_repo.dart'
    as _i254;
import 'package:rivaan_project2/features/blog/domain/usecases/added_blog_use_case.dart'
    as _i666;
import 'package:rivaan_project2/features/blog/domain/usecases/get_blog_use_case.dart'
    as _i423;
import 'package:rivaan_project2/features/blog/domain/usecases/quote_use_case.dart'
    as _i623;
import 'package:rivaan_project2/features/blog/presintation/bloc/blog_bloc.dart'
    as _i147;
import 'package:rivaan_project2/features/blog/presintation/cubit/quote_cubit.dart'
    as _i337;
import 'package:rivaan_project2/features/subscribe/data/repo/sub_repo.dart'
    as _i479;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.lazySingleton<_i161.InternetConnection>(
      () => registerModule.internetConnection,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i703.BlogRemoteData>(
      () =>
          _i703.BlogRemoteDataImpl(supabaseClient: gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i566.AuthLocalData>(
      () => _i566.AuthLocalDataImpl(storage: gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i311.BlogLocalDataSource>(
      () => _i311.BlogLocalDataSourceImpl(gh<_i979.Box<dynamic>>()),
    );
    gh.lazySingleton<_i479.SubRepo>(() => _i479.SubRepoImpl());
    gh.lazySingleton<_i260.AuthRemoteData>(
      () =>
          _i260.AuthRemoteDataImpl(supabaseClient: gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i412.QuoteRemoteData>(
      () => _i412.QuoteRemoteDataImplement(gh<_i309.QuoteApiService>()),
    );
    gh.lazySingleton<_i639.Inerceptorr>(
      () => _i639.Inerceptorr(
        authRemoteData: gh<_i260.AuthRemoteData>(),
        localData: gh<_i566.AuthLocalData>(),
      ),
    );
    gh.lazySingleton<_i70.ConnectionChecker>(
      () => _i70.ConnectionCheckerImpl(
        internetConnection: gh<_i161.InternetConnection>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(
        gh<_i260.AuthRemoteData>(),
        gh<_i566.AuthLocalData>(),
      ),
    );
    gh.lazySingleton<_i686.BlogRepo>(
      () => _i867.BlogRepoImpl(
        remoteData: gh<_i703.BlogRemoteData>(),
        connectionChecker: gh<_i70.ConnectionChecker>(),
        localData: gh<_i311.BlogLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i666.AddedBlogUseCase>(
      () => _i666.AddedBlogUseCase(repo: gh<_i686.BlogRepo>()),
    );
    gh.lazySingleton<_i423.GetBlogUseCase>(
      () => _i423.GetBlogUseCase(repo: gh<_i686.BlogRepo>()),
    );
    gh.lazySingleton<_i254.QuoteRepository>(
      () => _i968.QuoteRepositoryImpl(remoteData: gh<_i412.QuoteRemoteData>()),
    );
    gh.lazySingleton<_i719.AuthRepo>(
      () => _i180.AuthRepoImpl(
        authRemoteData: gh<_i260.AuthRemoteData>(),
        connectionChecker: gh<_i70.ConnectionChecker>(),
        localData: gh<_i566.AuthLocalData>(),
      ),
    );
    gh.lazySingleton<_i706.AuthCurrentUserUseCase>(
      () => _i706.AuthCurrentUserUseCase(repo: gh<_i719.AuthRepo>()),
    );
    gh.lazySingleton<_i198.AuthLoginUseCase>(
      () => _i198.AuthLoginUseCase(repo: gh<_i719.AuthRepo>()),
    );
    gh.lazySingleton<_i1.AuthSignupUseCases>(
      () => _i1.AuthSignupUseCases(repo: gh<_i719.AuthRepo>()),
    );
    gh.factory<_i147.BlogBloc>(
      () => _i147.BlogBloc(
        addedBlogUserCase: gh<_i666.AddedBlogUseCase>(),
        getBlocUseCase: gh<_i423.GetBlogUseCase>(),
      ),
    );
    gh.lazySingleton<_i623.GetQuoteUseCase>(
      () => _i623.GetQuoteUseCase(repo: gh<_i254.QuoteRepository>()),
    );
    gh.factory<_i337.QuoteCubit>(
      () => _i337.QuoteCubit(getQuoteUseCase: gh<_i623.GetQuoteUseCase>()),
    );
    gh.factory<_i1019.AuthBloc>(
      () => _i1019.AuthBloc(
        signInUserCase: gh<_i1.AuthSignupUseCases>(),
        loginUseCase: gh<_i198.AuthLoginUseCase>(),
        currentUseCase: gh<_i706.AuthCurrentUserUseCase>(),
        userCubit: gh<_i390.AppUserCubit>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i13.RegisterModule {}
