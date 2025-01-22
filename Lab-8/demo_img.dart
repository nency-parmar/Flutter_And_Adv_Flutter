import 'package:flutter/material.dart';

class DemoImg extends StatelessWidget {
  const DemoImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Display Image"),backgroundColor: Colors.white,),
      body:
        // By Download
        //   Image.asset("assets/images/images.jpeg",fit: BoxFit.cover,),
        //   Text("Hello",style: TextStyle(fontSize: 100,color: Colors.black),),

        // By URL
      Container(
        height: 600,
        width: 600,
        child: Positioned(
          left: 40,
          top: 20,
          child: Image.network("https://t3.ftcdn.net/jpg/02/90/89/76/360_F_290897614_7RdAsk2GmumcGWZ2qklmV74hKlNmznSx.jpg",),
        ),
      )

    );
  }
}
