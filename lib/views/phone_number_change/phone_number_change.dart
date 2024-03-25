import 'package:flutter/material.dart';

class PhoneNumberChangeScreen extends StatefulWidget {
  const PhoneNumberChangeScreen({super.key});
  static const route = "phoneNumberChangeScreen";
  @override
  State<PhoneNumberChangeScreen> createState() =>
      _PhoneNumberChangeScreenState();
}

class _PhoneNumberChangeScreenState extends State<PhoneNumberChangeScreen> {
  bool phoneNumber = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Phone number",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "Main Phone number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefix: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset("assets/images/England.png"),
                    ),
                    hintText: "Phone number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Use the phone number to reset your\n password"),
                  Switch(
                      inactiveThumbColor: Colors.grey,
                      activeColor: Color(0xFF3366FF),
                      value: phoneNumber,
                      onChanged: (value) {
                        setState(() {
                          phoneNumber = !phoneNumber;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 520,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
