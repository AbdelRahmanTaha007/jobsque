import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});
  static const route = "LanguageScreen";

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<String> languages = [
    "English",
    "Indonsia",
    "Arabic",
    "Chinese",
    "Dutch",
    "French",
    "German",
    "Japanese",
    "Korean",
    "Portuguese",
  ];
  var groupValue = "Arabic";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            height: 70,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: ListTile(
              title: Text(
                languages[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Image.asset("assets/images/England.png"),
              trailing: Radio(
                  value: languages[index],
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  }),
            ),
          );
        },
      ),
    );
  }
}
