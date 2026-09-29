import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract interface class ConnectionChecker {
  Future<bool> get isConnected;
}

@LazySingleton(as : ConnectionChecker)
class ConnectionCheckerImpl implements ConnectionChecker{
  final InternetConnection _internetConnection;

  ConnectionCheckerImpl({required InternetConnection internetConnection
  }) :_internetConnection = internetConnection  ;
  @override
  Future<bool> get isConnected async => _internetConnection.hasInternetAccess;
}