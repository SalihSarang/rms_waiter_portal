import 'package:flutter/material.dart';
import 'login_form.dart';
import 'login_header.dart';

/// The main content body of the Login Screen.
class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Column(children: [LoginHeader(), LoginForm()]),
    );
  }
}
