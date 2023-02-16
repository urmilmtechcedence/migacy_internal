import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'connection_event/connection_event.dart';
import 'connection_state/connection_state.dart';

class ConnectedBloc extends Bloc<ConnectedEvent, ConnectedState> {
  StreamSubscription? subscription;

  ConnectedBloc() : super(ConnectedInitialState()) {
    on<OnConnectedEvent>((event, emit) => emit(ConnectedSucessState()));
    on<OnNotConnectedEvent>((event, emit) => emit(ConnectedFailureState()));

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(OnConnectedEvent());
      } else {
        add(OnNotConnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
