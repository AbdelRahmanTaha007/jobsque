import 'package:flutter/material.dart';
import 'package:jobsque/views/boarding_screen/components/boarding_first_page.dart';
import 'package:jobsque/views/boarding_screen/components/boarding_third_page.dart';
import 'package:jobsque/views/boarding_screen/components/boardingsecond_page.dart';
import 'package:jobsque/views/signup_screen/signup_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});
  static const route = "boardingScreen";
  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageIndex = controller.page?.round() ?? 0;
      });
    });
  }

  final controller = PageController();
  var currentPageIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/splash_logo.png"),
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                        if (currentPageIndex == 2) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ));
                          setState(() {});
                        }
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ))
                ],
              ),
            ),
            Container(
              height: 550,
              child: PageView(
                controller: controller,
                children: const [
                  BoardingFirstPage(),
                  BoardingSecondPage(),
                  BoardingThirdPage()
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SmoothPageIndicator(
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut),
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 8.0,
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  activeDotColor: Color(0xFF3366FF),
                  dotColor: Color(0xFFADC8FF),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                currentPageIndex = controller.page?.round() ?? 0;
                controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
                setState(() {});
                if (currentPageIndex == 2) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ));
                }
              },
              child: Text(currentPageIndex == 2 ? "Get Started" : "Next"),
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(10),
                  minimumSize:
                      MaterialStateProperty.all(const Size(350.0, 50.0))),
            ),
          ],
        ),
      ),
    );
  }
}
