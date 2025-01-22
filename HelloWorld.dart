import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Helloworld extends StatelessWidget {
  const Helloworld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello World App"),backgroundColor: Colors.pink,),
      body: Center(
        child: Text(
          'Hello World',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
