import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'validators.dart';

class Bloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Add data to the stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValidation =>
      CombineLatestStream.combine2(email, password, (e, p) {
        if (e == _email.value && p == _password.value) {
          return true;
        }
        return false;
      });

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit(){
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is valid email: $validEmail');
    print('Password is valid password: $validPassword');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
