import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_event/auth_event.dart';
import '../auth_state/auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialAuthState());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthLoginUsingMobile) {
      yield* mapLoginToState(event.mobileNumber);
    }
    if (event is AuthSendSmsEvent) {
      yield* mapLoginToState(event.mobileNumber);
    }
  }

  @override
  AuthState get initState => InitialAuthState();

  /// For[Login]
  Stream<AuthState> mapLoginToState(String userPhoneNumber) async* {
    yield AuthUsingMobileInProgress();

    try {
      // await UserAuthRepository()
      //     .initialzeUserSession(userPhoneNumber: userPhoneNumber);

      yield SucceedAuthUsingMobile();
    } catch (e) {
      log(e.toString());
      yield FailureAuthUsingMobile();
    }
  }

  /// [For Verify Otp]
  Stream<AuthState> mapLoginUsingOtpToState(String otp) async* {
    yield AuthUsingOtpProgress();

    try {
      // await UserAuthRepository().verifyOTP(otp: otp);

      yield AuthUsingOtpSucceed();
    } catch (e) {
      log(e.toString());
      yield AuthUsingOtpFailed(message: e.toString());
    }
  }



}
