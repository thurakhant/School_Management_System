import 'package:flutter/material.dart';
import '../DataModel/user.dart';

@immutable
abstract class BlocState {}

class Inital extends BlocState {}

class Loading extends BlocState {}

class Failed extends BlocState {
  final Exception exception;
  Failed(this.exception);
}

class Aunthenticated extends BlocState {
  final User user;
  Aunthenticated(this.user);
}
