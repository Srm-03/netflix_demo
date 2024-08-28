import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:streaming_app/homepage.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          child: Lottie.asset(
            'assets/lottie/netflix.json',
            fit: BoxFit.cover, // path to your Lottie file
            onLoaded: (composition) {
              // When the animation is completed, navigate to the homepage
              Future.delayed(composition.duration, () {
                Get.off(StreamingAppListScreen());
              });
            },
          ),
        ),
      ),
    );
  }
}
