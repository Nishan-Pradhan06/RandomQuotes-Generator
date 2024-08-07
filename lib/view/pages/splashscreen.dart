// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learngin/view/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>const HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.white,
      child: Center(
        child: Image.asset(
          "assets/logo.png",
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
