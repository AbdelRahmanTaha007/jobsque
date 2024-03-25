import 'package:flutter/material.dart';
import 'package:jobsque/views/account_done_screen/account_done_screen.dart';
import 'package:jobsque/views/splash_screen/splash_screen.dart';

class PreferredLocationScreen extends StatefulWidget {
  const PreferredLocationScreen({super.key});
  static const route = "preferredLocationScreen";
  @override
  State<PreferredLocationScreen> createState() =>
      _PreferredLocationScreenState();
}

class _PreferredLocationScreenState extends State<PreferredLocationScreen> {
  List<String> countries = [
    "United States",
    "Malaysia",
    "Singapore",
    "Indonesia",
    "Philiphines",
    "Poland",
    "India",
    "Vietnam",
    "China",
    "Canada",
  ];
  var selectedItems = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromRGBO(244, 244, 245, 1),
                  ),
                  margin: EdgeInsets.only(left: 40, right: 48),
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            padding: EdgeInsets.all(9),
                            child: Text(
                              "Work from office",
                              style: TextStyle(color: Colors.black),
                            )),
                        Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(9, 26, 122, 1),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(25)),
                            padding: EdgeInsets.all(9),
                            child: Text("Work from Home",
                                style: TextStyle(color: Colors.white))),
                      ]),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(child: Text("Select the country you want for your job")),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 40),
                height: 300,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 45,
                  ),
                  itemCount: countries.length,
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
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Center(
                          child: Text(
                            countries[index],
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
                          builder: (context) => AccountDoneScreen(),
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
