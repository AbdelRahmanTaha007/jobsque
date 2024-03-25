import 'package:flutter/material.dart';
import 'package:jobsque/views/preferred_location_screen/preferred_location_screen.dart';
import 'package:jobsque/views/splash_screen/splash_screen.dart';

class SignupInterestsScreen extends StatefulWidget {
  const SignupInterestsScreen({super.key});
  static const route = "signupInterestsScreen";

  @override
  State<SignupInterestsScreen> createState() => _SignupInterestsScreenState();
}

class _SignupInterestsScreenState extends State<SignupInterestsScreen> {
  List<bool> selectedItems = List.generate(6, (index) => false);

  List<String> interests = [
    "UI/UX Designer",
    "Ilustrator Designer",
    "Developer",
    "Management",
    "Information Technology",
    "Research and Analytics"
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            children: [
              Text(
                "What type of work are you interested in ?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Tell us what you’re interested in so we can customize the app for your needs.",
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 430,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 30,
                    mainAxisExtent: 125,
                  ),
                  itemCount: interests.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          // Toggle the selected state of the tapped item
                          selectedItems[index] = !selectedItems[index];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedItems[index]
                              ? Color.fromARGB(56, 51, 102, 255)
                              : Color.fromARGB(50, 158, 158, 158),
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            interests[index],
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PreferredLocationScreen(),
                        ));
                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
