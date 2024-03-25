import 'package:flutter/material.dart';
import 'package:jobsque/views/apply_job_screen/apply_job_success.dart';
import 'package:jobsque/views/home_screen/home_screen.dart';

class ApplyJobScreenThird extends StatefulWidget {
  const ApplyJobScreenThird({super.key});
  static const route = "applyJobThird";
  @override
  State<ApplyJobScreenThird> createState() => _ApplyJobScreenThirdState();
}

class _ApplyJobScreenThirdState extends State<ApplyJobScreenThird> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(
                  context
                  );
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Apply job"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFF3366FF),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Bio data",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Divider(),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFF3366FF),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Type of work",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Divider(),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(50),
                          // color: Color(0xFF3366FF),
                        ),
                        child: Text(
                          "3",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "upload portfolio",
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Upload portfolio",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text("Fill in your bio data correctly"),
              SizedBox(
                height: 20,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Upload CV",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                TextSpan(
                    text: "*",
                    style:
                        TextStyle(color: Colors.deepOrangeAccent, fontSize: 20))
              ])),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/Logo.png"),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "CV name.CV",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("CV.pdf 300KB"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                            //onTap remove
                            child:
                                Image.asset("assets/images/close-circle.png")),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                            //onTap Edit
                            child: Image.asset("assets/images/edit-2.png")),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Other File",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(style: BorderStyle.none),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(236, 242, 255, 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromRGBO(102, 144, 255, 1),
                      ),
                      padding: EdgeInsets.all(8),
                      child: CircleAvatar(
                        child: Image.asset("assets/images/document-upload.png"),
                      ),
                    ),
                    Text(
                      "Upload your other file",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "Max file size 10MB",
                    ),
                    Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF3366FF)),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/export.png"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Add file"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApplyJobScreenSuccess(),
                        ));
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
