import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      cursorColor: Colors.indigo,
      style: TextStyle(
        color: Colors.green,
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: "Email Address",
        hintText: "you@example.com",
      ),
      validator: validateEmail,
      onSaved: (value) {
        email = value;
        print(value);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      keyboardAppearance: Brightness.dark,
      autovalidate: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: "Password",
          hintText: "Enter your password"),
      obscureText: true,
      validator: validatePassword,
      onSaved: (value) {
        password = value;
        print(value);
      },
    );
  }

  Widget submitButton() {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: RaisedButton(
          child: Text('Submit'),
          color: Colors.cyan,
          onPressed: () {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              print('Hello $email. Your password is $password');
            }
          },
        ));
  }
}