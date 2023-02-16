import 'package:flutter/material.dart';

@immutable
abstract class ConnectedState {}

class ConnectedInitialState extends ConnectedState {}

class ConnectedSucessState extends ConnectedState {}

class ConnectedFailureState extends ConnectedState {}