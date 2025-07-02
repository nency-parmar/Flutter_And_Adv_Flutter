import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Parts9_1 extends StatelessWidget {
  const Parts9_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("9 Parts Using Row Column"),backgroundColor: Colors.black26,),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Container(color: Colors.red,)),
              Expanded(child: Container(color: Colors.green,)),
              Expanded(child: Container(color: Colors.blueAccent,)),
            ],
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.brown,)),
                Expanded(child: Container(color: Colors.grey,)),
                Expanded(child: Container(color: Colors.purple,)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.black,)),
                Expanded(child: Container(color: Colors.pink,)),
                Expanded(child: Container(color: Colors.deepOrangeAccent,)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}