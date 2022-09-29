import 'package:flutter/material.dart';
import 'package:login_page/src/controller/login_controller.dart';
import 'package:login_page/src/view/loginPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: ((context) => Auth()))],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/': ((context) => const LoginPage())},
    );
  }
}
