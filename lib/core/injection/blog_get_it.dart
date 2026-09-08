
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rivaan_project2/features/blog/data/datasource/remoteData/blog_remote_data.dart';
import 'package:rivaan_project2/features/blog/data/datasource/locaData/blog_local_data_source.dart';
import 'package:rivaan_project2/features/blog/data/repositry/blog_repo_impl.dart';
import 'package:rivaan_project2/features/blog/domain/repo/blog_repo.dart';
import 'package:rivaan_project2/features/blog/domain/usecases/added_blog_use_case.dart';
import 'package:rivaan_project2/features/blog/domain/usecases/get_blog_use_case.dart';
import 'package:rivaan_project2/features/blog/presintation/bloc/blog_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../network/connection_checker.dart';

final slBlog=GetIt.instance;
void blogGetIt(){
  slBlog.registerLazySingleton(() => Supabase.instance.client,);
  slBlog.registerLazySingleton(() => InternetConnection(),);
  slBlog.registerLazySingleton(() => Hive.box('blogs'),);

  slBlog.registerLazySingleton<BlogRemoteData>(() => BlogRemoteDataImpl(supabaseClient: slBlog()),);
  slBlog.registerFactory(() => ConnectionChecker,);
  slBlog.registerLazySingleton<BlogLocalDataSource>(() => BlogLocalDataSourceImpl(slBlog()),);
  slBlog.registerLazySingleton<BlogRepo>(() => BlogRepoImpl(remoteData: slBlog(), connectionChecker: slBlog(), localData: slBlog()),);
  slBlog.registerLazySingleton(() => AddedBlogUseCase(repo: slBlog()),);
  slBlog.registerLazySingleton(() => GetBlogUseCase(repo: slBlog()),);
  slBlog.registerFactory(() => BlogBloc(
        addedBlogUserCase: slBlog()
      , getBlocUseCase: slBlog()));
}