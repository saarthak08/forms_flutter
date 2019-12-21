import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import '../bloc/provider.dart';

class LoginScreenBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            emailField(bloc),
            passwordField(bloc),
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            submitButton(bloc)
          ],
        ));
  }

  Widget emailField(bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          cursorColor: Colors.indigo,
          style: TextStyle(
            color: Colors.green,
          ),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: "Email Address",
            hintText: "you@example.com",
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
              onChanged: bloc.changePassword,
              keyboardAppearance: Brightness.dark,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Password",
                hintText: "Enter your password",
                errorText: snapshot.error,
              ),
              obscureText: true);
        });
  }

  Widget submitButton(bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text('Login'),
                color: Colors.cyan,
                onPressed: snapshot.hasData ? bloc.submit : null,
              ));
        });
  }
}
