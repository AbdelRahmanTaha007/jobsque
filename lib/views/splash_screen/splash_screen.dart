import 'package:flutter/material.dart';
import 'package:jobsque/controllers/db/offline/shared_helper.dart';
import 'package:jobsque/views/boarding_screen/boarding_screen.dart';
import 'package:jobsque/views/bottom_nav_bar_screen/bottom_nav_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const route = "splashScreen";
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => SharedHelper.prefs.getBool("isLogin") ?? false
              ? BoardingScreen()
              : BottomNavBarScreen(),
        ),
      );
    });
    // Future.delayed(Duration(seconds: 2), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (_) => SharedHelper.prefs.getBool("isLogin") ?? false
    //           ? HomeScreen()
    //           : LoginScreen(),
    //     ),
    //   );
    // });

    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/splash_logo.png"),
      ),
    );
  }
}
