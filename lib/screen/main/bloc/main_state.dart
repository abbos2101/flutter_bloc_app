part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class LoadingState extends MainState {}

class SuccessState extends MainState {
  final List<UserModel> userList;

  SuccessState({this.userList});
}

class FailState extends MainState {
  final String message;

  FailState({this.message});
}
