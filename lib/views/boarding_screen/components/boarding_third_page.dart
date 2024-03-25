import 'package:flutter/material.dart';

class BoardingThirdPage extends StatelessWidget {
  const BoardingThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 15),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/image 9.png"),
          const SizedBox(
            height: 20,
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Get the best ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: 'choice for the job ',
                  style: TextStyle(
                      color: Color(0xFF3366FF),
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: "you've always dreamed of",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "The better the skills you have, the greater the good job opportunities for you.",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
