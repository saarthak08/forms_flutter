import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/login_bloc.dart';
import 'bloc/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
            title: 'Log Me In!',
            darkTheme: ThemeData.dark(),
            home: Scaffold(
              body: LoginScreenBloc(),
            )));
  }
}
