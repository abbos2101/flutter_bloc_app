import 'package:flutter/material.dart';

class ContentScreen extends StatefulWidget {
  static MaterialPageRoute route({
    @required String login,
    @required String password,
  }) =>
      MaterialPageRoute(
          builder: (_) => screen(login: login, password: password));

  static Widget screen({
    @required String login,
    @required String password,
  }) =>
      ContentScreen(login, password);

  final String login;
  final String password;

  const ContentScreen(this.login, this.password);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("${widget.login}\n${widget.password}")),
    );
  }
}
