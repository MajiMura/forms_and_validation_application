import 'package:flutter/material.dart';
import 'package:forms_and_validation_appli/src/screens/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Log me in!',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
