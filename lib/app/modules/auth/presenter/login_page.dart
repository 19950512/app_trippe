import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth - Login '),
      ),
      body: Column(children: [
        ElevatedButton(
          onPressed: () => {},
          child: const Text('Tela de Login'),
        ),
      ]),
    );
  }
}
