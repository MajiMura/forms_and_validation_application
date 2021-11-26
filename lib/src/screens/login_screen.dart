import 'package:flutter/material.dart';
import 'package:forms_and_validation_appli/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String? email = '';
  String? password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      child: Form(
        key: formKey,
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
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      validator: validateEmail,
      onSaved: (value) {
        email = value;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      validator: validatePassword,
      onSaved: (value) {
        password = value;
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.blue),
      onPressed: () {
        if(formKey.currentState != null && formKey.currentState!.validate()) {
          formKey.currentState!.save();
          print('Time to post email: $email and password: $password to my API.');
        }
      },
      child: const Text('Submit'),
    );
  }
}
