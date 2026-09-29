import 'dart:async';

import 'package:injectable/injectable.dart';

abstract interface class SubRepo {
  Future<void>subscribe();
}

@LazySingleton(as: SubRepo)
class SubRepoImpl implements SubRepo {
  @override
  Future<void> subscribe()async {
      try{
        await Future.delayed(const Duration(seconds: 3));
      }catch(e){
        throw Exception(e.toString());
      }
  }
}