import 'dart:async';

import 'package:contactcars_task/core/network/cubit/network_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  StreamSubscription? subscription;
  InternetConnectionCubit() : super(InternetConnectionInitial());

  // Stream Subscription to listen to internet connection changes.
  void checkConnectivity() {
    subscription = InternetConnectionChecker()
        .onStatusChange
        .listen((InternetConnectionStatus result) {
      if (result == InternetConnectionStatus.connected) {
        emit(InternetConnectedState('Internet Connected'));
      } else {
        emit(InternetNotConnectedState('Internet Not Connected'));
      }
    });
  }

  Future<void> closeSubscription() {
    subscription?.cancel();
    return super.close();
  }
}
