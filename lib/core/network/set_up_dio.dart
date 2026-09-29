import 'package:dio/dio.dart';
import 'package:rivaan_project2/features/auth/data/datasource/localdata/auth_local_data.dart';
import 'package:rivaan_project2/features/auth/data/datasource/remote/auth_remote_data.dart';

import '../network/Interceptor.dart';

Dio setUpDio(AuthLocalData local , AuthRemoteData remote){
  final option = BaseOptions(
    baseUrl:  'https://dummyjson.com',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
  final dio = Dio(option);

  dio.interceptors.add(Inerceptorr(authRemoteData: remote , localData: local));

  return dio;
}