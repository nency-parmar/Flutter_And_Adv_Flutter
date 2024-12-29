import 'package:flutter/material.dart';

class Parts9_2 extends StatelessWidget {
  const Parts9_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("9 Parts Different Sizes"),
        backgroundColor: Colors.black26,
      ),
      body: Column(
        children: [
          // First Row
          Expanded(
            flex: 2,  // Double the size
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.grey)),
                Expanded(child: Container(color: Colors.brown)),
                Expanded(child: Container(color: Colors.red)),
              ],
            ),
          ),
          // Second Row
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.orange)),
                Expanded(child: Container(color: Colors.green)),
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.yellow),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.blue)),
                Expanded(child: Container(color: Colors.purpleAccent)),
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.purple),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}