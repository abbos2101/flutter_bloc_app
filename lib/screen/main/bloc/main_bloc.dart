import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/data/model/user_model.dart';
import 'package:flutter_bloc_app/data/net/user_service.dart';
import 'package:flutter_bloc_app/screen/content/content_screen.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final BuildContext context;

  MainBloc(this.context) : super(LoadingState());
  final UserService _userService = UserService();
  List<UserModel> _userList = [];

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is LaunchEvent)
      yield* _eventLaunch(event);
    else if (event is LoginEvent) yield* _eventLogin(event);
  }

  Stream<MainState> _eventLaunch(LaunchEvent event) async* {
    yield LoadingState();
    _userList = await _userService.getUsers();
    if (_userList.isEmpty)
      yield FailState(message: "Bo'sh List");
    else
      yield SuccessState(userList: _userList);
  }

  Stream<MainState> _eventLogin(LoginEvent event) async* {
    Navigator.push(
      context,
      ContentScreen.route(login: event.login, password: event.password),
    );
  }
}
