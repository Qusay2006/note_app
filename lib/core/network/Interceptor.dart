import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rivaan_project2/features/auth/data/datasource/localdata/auth_local_data.dart';
import 'package:rivaan_project2/features/auth/data/datasource/remote/auth_remote_data.dart';


@LazySingleton()
class Inerceptorr extends Interceptor{
  final AuthRemoteData _authRemoteData;
  final AuthLocalData _localData;
  Inerceptorr({ required this._authRemoteData, required this._localData});

  @override
  void onRequest (RequestOptions options,RequestInterceptorHandler handler ,)async{


    final token =await _localData.getToken();

    if(token!=null){
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }


  @override
  void onResponse (Response response ,ResponseInterceptorHandler handler){
    print(response.statusCode);
    super.onResponse(response, handler);

  }

  @override
  void onError(DioException err ,ErrorInterceptorHandler handler )async {
    try {
      final authResponse = await _authRemoteData.currentUserState;
      String? newToken = authResponse!.accessToken;
      await _localData.saveToken(newToken);
      err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
      final response =await Dio().fetch(err.requestOptions);
      return handler.resolve(response);
    } catch (e) {
      return super.onError(err, handler);
    }
  }
}
