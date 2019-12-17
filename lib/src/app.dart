import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/login_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Log Me In!',
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          body: LoginScreenBloc(),
        ));
  }
}
