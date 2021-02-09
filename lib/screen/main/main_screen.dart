import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/main_bloc.dart';

class MainScreen extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => screen());

  static Widget screen() => BlocProvider(
        create: (context) => MainBloc(context),
        child: MainScreen(),
      );

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<MainBloc>(context);
    bloc.add(LaunchEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: widgetAppBar(state),
          body: widgetBody(state),
          floatingActionButton: widgetFloatButton(state),
        );
      },
    );
  }

  Widget widgetAppBar(MainState state) {
    if (state is LoadingState) return AppBar(title: Text("Loading"));
    if (state is SuccessState) return AppBar(title: Text("Success"));
    if (state is FailState) return AppBar(title: Text("${state.message}"));

    return AppBar(title: Text("Users"));
  }

  Widget widgetBody(MainState state) {
    if (state is LoadingState)
      return Center(child: CircularProgressIndicator());
    if (state is SuccessState)
      return ListView.builder(
        itemCount: state.userList.length,
        itemBuilder: (context, index) => Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            "${state.userList[index].name}",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    if (state is FailState)
      return Center(
          child: Text(
        "${state.message}",
        style: TextStyle(fontSize: 25),
      ));

    return SizedBox();
  }

  Widget widgetFloatButton(MainState state) {
    if (state is LoadingState) return SizedBox();
    if (state is SuccessState)
      return FloatingActionButton(onPressed: () {
        bloc.add(LoginEvent(login: "Sobir", password: "123"));
      });
    if (state is FailState) return SizedBox();

    return SizedBox();
  }
}
