import 'package:flutter/material.dart';

class BoardingSecondPage extends StatelessWidget {
  const BoardingSecondPage({super.key});

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
                  text: 'Hundreds of jobs are\nwaiting for you to ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: 'Join\ntogether',
                  style: TextStyle(
                      color: Color(0xFF3366FF),
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Immediately join us and start applying for the job you are interested in.",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
