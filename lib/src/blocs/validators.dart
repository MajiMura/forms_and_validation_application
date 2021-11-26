import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
        sink.add(email);
        if(!validEmail(email)) {
          sink.addError('Enter a valid email');
        }
      }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        sink.add(password);
        if(!validPassword(password)) {
          sink.addError('Password must be greater than 3 characters');
        }
      }
  );

  static bool validEmail(String email) {
    return email.contains('@');
  }

  static bool validPassword(String password) {
    return password.length > 3;
  }
}
