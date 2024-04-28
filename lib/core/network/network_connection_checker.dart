import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class CheckInternet {
  Future<bool> get isConnected;
}

class CheckInternetImpl implements CheckInternet {
  final InternetConnectionChecker checkInternet;

  CheckInternetImpl(this.checkInternet);

  @override
  Future<bool> get isConnected => checkInternet.hasConnection;
}