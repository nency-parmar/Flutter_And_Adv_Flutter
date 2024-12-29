import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//Write a flutter code to divide horizontal space of screen in 3 different equal parts with
// different colors.
class Horizontalspace extends StatelessWidget {
  const Horizontalspace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello World"),backgroundColor: Colors.pink,),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.greenAccent,)),
          Expanded(child: Container(color: Colors.purpleAccent,)),
          Expanded(child: Container(color: Colors.yellowAccent,)),
        ],
      ),
    );
  }
}