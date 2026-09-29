import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract interface class AuthLocalData {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}
@LazySingleton(as: AuthLocalData)
class AuthLocalDataImpl implements AuthLocalData {
  final FlutterSecureStorage _storage ;
  AuthLocalDataImpl({required this._storage});

  String _tokenKey = 'authToken';

  @override
  Future<void> deleteToken()async {
    await _storage.delete(key:_tokenKey );
  }

  @override
  Future<String?> getToken()async {
    return await _storage.read(key:_tokenKey );
  }

  @override
  Future<void> saveToken(String token)async {
    await _storage.write(key:_tokenKey ,value : token);

  }
}