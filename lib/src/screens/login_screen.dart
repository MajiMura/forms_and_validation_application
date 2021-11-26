import 'package:flutter/material.dart';

import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final Bloc bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      child: Column(children: [
        _emailField(),
        _passwordField(),
        Container(
          margin: const EdgeInsets.only(
            bottom: 25.0,
          ),
        ),
        _submitButton(),
      ]),
    );
  }

  Widget _emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              errorText: snapshot.error?.toString(), hintText: 'you@example.com', labelText: 'Email Address'),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget _passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          decoration:
              InputDecoration(errorText: snapshot.error?.toString(), hintText: 'Password', labelText: 'Password'),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.blue),
      onPressed: () {},
      child: const Text('Submit'),
    );
  }
}
