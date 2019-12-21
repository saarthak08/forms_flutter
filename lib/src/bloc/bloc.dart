import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'validators.dart';

class Bloc extends Object with Validators {
  //final _email = StreamController<String>.broadcast();
  //final _password = StreamController<String>.broadcast();

  //Subjects are StreamControllers
  final _email = BehaviourSubject<String>();
  final _password = BehaviourSubject<String>();

  //Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  //change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is $validEmail\nPassword is $validPassword');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}

//final bloc = Bloc();   //Single Instance Scope
