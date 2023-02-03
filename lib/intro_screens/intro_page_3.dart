import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/sunflower.png",
            height: 100,
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            color: Colors.blue[100],
            child: Center(
                child: Text(
              'Bart Lo gets the job done!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
        ],
      ),
    );
  }
}
