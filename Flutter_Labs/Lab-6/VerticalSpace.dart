import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//Write a flutter code to divide the vertical space of the screen in 3 different equal parts with
// different colors.
class VerticalSpace extends StatelessWidget {
  const VerticalSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello World"),backgroundColor: Colors.pink,),
      body: Row(
        children: [
          Expanded(child: Container(color: Colors.greenAccent,)),
          Expanded(child: Container(color: Colors.purpleAccent,)),
          Expanded(child: Container(color: Colors.yellowAccent,)),
        ],
      ),
    );
  }
}