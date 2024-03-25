import 'package:flutter/material.dart';

class BoardingFirstPage extends StatelessWidget {
  const BoardingFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 15),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/image 8.png"),
          const SizedBox(
            height: 20,
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Find a job, and ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: 'Start\nbuilding',
                  style: TextStyle(
                      color: Color(0xFF3366FF),
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: ' your career\nfrom now on',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Explore over 25,924 available job roles and upgrade your operator now.",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
