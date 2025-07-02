import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack Layout"),),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network("assets/images/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg.webp",fit: BoxFit.cover,),
          Positioned(
            top: 200,
            left: 450,
            child: Text("Stack Widget",style: TextStyle(fontSize: 100,color: Colors.white),),
          )
        ],
      ),
    );
  }
}
