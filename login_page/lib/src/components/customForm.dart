import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login_page/src/controller/login_controller.dart';

class CustomForm extends StatefulWidget {
  CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

enum AuthMode { singup, login }

final _formkey = GlobalKey<FormState>();

class _CustomFormState extends State<CustomForm> {
  AuthMode _authMode = AuthMode.login;
  void _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.singup;
      } else {
        _authMode = AuthMode.login;
      }
    });
  }

  bool _isLogin() => _authMode == AuthMode.login;
  bool _isSingUp() => _authMode == AuthMode.singup;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Map<String, String> _authData = {'email': '', 'password': ''};

  bool _obscureText = true;

  void obscureTextFn() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  bool _isLoading = false;
  _submit() {
    final isValid = _formkey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() => _isLoading = true);
    auth.signup(_authData['email']!, _authData['password']!);
    _formkey.currentState?.save();
    setState(() => _isLoading = false);

    print(_authData);
  }

  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      alignment: Alignment.center,
      child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                  child: TextFormField(
                    validator: (_email) {
                      final email = _email ?? '';
                      if (email.trim().isEmpty || !email.contains('@')) {
                        return 'E-mail adress is not valid!';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (email) => _authData['email'] = email ?? '',
                    decoration: const InputDecoration(
                        border: InputBorder.none, labelText: 'E-mail'),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                  child: TextFormField(
                    validator: (_password) {
                      final passowrd = _password ?? '';
                      if (passowrd.isEmpty || passowrd.length < 5) {
                        return 'Password is invalid!';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (password) =>
                        _authData['password'] = password ?? '',
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () => obscureTextFn(),
                            icon: const Icon(Icons.remove_red_eye)),
                        border: InputBorder.none,
                        labelText: 'Password'),
                    controller: _passwordController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (_isSingUp())
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                    child: TextFormField(
                      validator: _isLogin()
                          ? null
                          : (_password) {
                              final password = _password ?? '';
                              if (password != _passwordController.text) {
                                return 'Error';
                              } else {
                                return null;
                              }
                            },
                      onSaved: (password) =>
                          _authData['password'] = password ?? '',
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Confirm Password'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {}, child: const Text('Recovery Password')),
              ),
              const SizedBox(
                height: 10,
              ),
              _isLoading
                  ? const CircularProgressIndicator()
                  : InkWell(
                      onTap: _submit,
                      child: Container(
                        child: Center(
                            child: Text(
                          _isLogin() ? 'Login' : 'Sign In',
                          style: TextStyle(color: Colors.white),
                        )),
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member?'),
                  TextButton(
                      onPressed: () => _switchAuthMode(),
                      child: const Text('Register now')),
                ],
              )
            ],
          )),
    );
  }
}
