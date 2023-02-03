import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Image.asset(
            'assets/images/handshake.png',
            height: 300,
          )),
          Container(
            color: Colors.pink[100],
            child: Center(
              child: Text(
                'Bart Lo Pe Baat Lo!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
