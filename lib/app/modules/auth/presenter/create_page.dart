import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _ProductPageState();
}

class _ProductPageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth - Create '),
      ),
      body: Column(children: [
        ElevatedButton(
          onPressed: () => {},
          child: const Text('Tela de Create'),
        ),
      ]),
    );
  }
}
