import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  CustomForm({Key? key}) : super(key: key);

  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      alignment: Alignment.center,
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
              child: TextField(
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
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
              child: TextField(
                decoration: const InputDecoration(
                    border: InputBorder.none, labelText: 'Password'),
                controller: _emailController,
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
          InkWell(
            onTap: () {},
            child: Container(
              child: const Center(
                  child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white),
              )),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(15)),
            ),
          )
        ],
      )),
    );
  }
}
