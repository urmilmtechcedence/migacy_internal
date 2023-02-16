import 'package:flutter/material.dart';

@immutable
abstract class AuthState {}

class InitialAuthState extends AuthState {}

class SucceedAuthUsingMobile extends AuthState {}

class FailureAuthUsingMobile extends AuthState {}

class AuthUsingMobileInProgress extends AuthState {}


///[Verify Otp States]

class AuthUsingOtp extends AuthState {}

class AuthUsingOtpProgress extends AuthState {}

class AuthUsingOtpSucceed extends AuthState {}

class AuthUsingOtpFailed extends AuthState {
  final String message;
  AuthUsingOtpFailed({required this.message});
}

///[Resend Otp]

class AuthSendSmsAgainState extends AuthState {}
class AuthSendSmsAgainProgress extends AuthState {}
class AuthSendSmsAgainSucceed extends AuthState {}
class AuthSendSmsAgainFailed extends AuthState {
    final String message;
    AuthSendSmsAgainFailed ({required this.message});
}

