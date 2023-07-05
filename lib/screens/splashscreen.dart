import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Homepage/homepage.dart';
import '../constand.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/animation/79094-blue-shopping-cart.json",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            Text(
              "SLR SHOPEE",
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: 'poppins'),
            )
          ],
        ),
      ),
    );
  }
}
