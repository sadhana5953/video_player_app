import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player_app/View/Home_Page.dart';

class PlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red.shade600,
              Color(0xff8d1755),
              Colors.black,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background elements
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white.withOpacity(0.9),
                      size: 80,
                    ),
                  ),
                ),
              ),
            ),
            // Bottom text content
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 5,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(text: 'Player that '),
                        TextSpan(
                          text: 'plays',
                          style: TextStyle(color: Colors.pinkAccent),
                        ),
                        TextSpan(text: '\nAll'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ultimate solution to your media capabilities.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                      child: IconButton(onPressed: () {
                        Get.to(HomePage());
                      }, icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 24,
                      ),)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PlayerScreen(),
  ));
}
