import 'package:flutter/material.dart';

class RecoverPage extends StatefulWidget {
  const RecoverPage({Key? key}) : super(key: key);

  @override
  State<RecoverPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<RecoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth - Recover '),
      ),
      body: Column(children: [
        ElevatedButton(
          onPressed: () => {},
          child: const Text('Tela de Recover'),
        ),
      ]),
    );
  }
}
