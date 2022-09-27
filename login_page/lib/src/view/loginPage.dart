import 'package:flutter/material.dart';
import 'package:login_page/src/components/customForm.dart';
import 'package:login_page/src/components/titleLogin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 239, 243),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const TitleLogin(),
          CustomForm(),
        ],
      ),
    );
  }
}
