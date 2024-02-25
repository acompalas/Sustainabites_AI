import 'package:flutter/material.dart';

class IngredientsPage extends StatelessWidget {
  const IngredientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingredients'),
      ),
      body: Center(
        child: Text(
          'Ingredients Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
