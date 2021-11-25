import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      child: Form(
        child: Column(children: [
          _emailField(),
          _passwordField(),
          _submitButton(),
        ]),
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(labelText: 'Email Address',
      hintText: 'you@example.com',
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField();
  }

  Widget _submitButton() {
    return TextButton(
      onPressed: () {},
      child: const Text('Submit'),
    );
  }
}
