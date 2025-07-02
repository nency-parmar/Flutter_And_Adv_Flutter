import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Us Page"),),
      body: Center(
        child: Stack(
          children: [
            Text("Hello From Contact Page")
          ],
        ),
      ),
    );
  }
}