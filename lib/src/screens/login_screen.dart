import 'package:flutter/material.dart';
import 'package:forms_and_validation_appli/src/blocs/provider.dart';

import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(30.0),
      child: Column(children: [
        _emailField(bloc),
        _passwordField(bloc),
        Container(
          margin: const EdgeInsets.only(
            bottom: 25.0,
          ),
        ),
        _submitButton(bloc),
      ]),
    );
  }

  Widget _emailField(Bloc bloc) {
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

  Widget _passwordField(Bloc bloc) {
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

  Widget _submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValidation,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          onPressed: snapshot.data == true ? bloc.submit : null,
          child: const Text('Submit'),
        );
      },
    );
  }
}
