import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/heart.png",
            height: 250,
          ),
          Container(
            color: Colors.deepPurple[100],
            child: Center(
                child: Text(
              'The End Of Consumerism with Bart Lo',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black54),
            )),
          ),
        ],
      ),
    );
  }
}
