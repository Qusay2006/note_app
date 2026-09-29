import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rivaan_project2/features/auth/data/datasource/localdata/auth_local_data.dart';
import 'package:rivaan_project2/features/auth/data/datasource/remote/auth_remote_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../network/set_up_dio.dart';

@module
abstract class RegisterModule {

  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;

  @lazySingleton
  InternetConnection get internetConnection => InternetConnection();

  @lazySingleton
  Dio dio(AuthRemoteData remote , AuthLocalData local) => setUpDio(local , remote);
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

}
