abstract interface class ConnectionChecker {
  Future<bool> get isConnected;
}

class ConnectionCheckerImpl implements ConnectionChecker{
  final ConnectionChecker connectionChecker;

  ConnectionCheckerImpl({required this.connectionChecker});
  @override
  Future<bool> get isConnected async => connectionChecker.isConnected;
}