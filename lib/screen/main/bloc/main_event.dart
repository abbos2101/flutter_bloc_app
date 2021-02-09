part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class LaunchEvent extends MainEvent {}

class LoginEvent extends MainEvent {
  final String login;
  final String password;

  LoginEvent({this.login, this.password});
}
