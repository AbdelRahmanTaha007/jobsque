import 'package:flutter/material.dart';
import 'package:jobsque/main.dart';
import 'package:jobsque/views/apply_job_screen/apply_job_screen_second.dart';

class ApplyJobScreenFirst extends StatefulWidget {
  const ApplyJobScreenFirst({super.key});
  static const route = "applyJob";
  @override
  State<ApplyJobScreenFirst> createState() => _ApplyJobScreenFirstState();
}

class _ApplyJobScreenFirstState extends State<ApplyJobScreenFirst> {
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
        title: Text(
          "Apply job",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                        style: TextStyle(fontSize: 16),
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
                          "2",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Type of work",
                        style: TextStyle(fontSize: 16),
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
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Bio data",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text("Fill in your bio data correctly"),
              SizedBox(
                height: 30,
              ),
              Form(
                key: formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Full Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      TextSpan(
                          text: "*",
                          style: TextStyle(
                              color: Colors.deepOrangeAccent, fontSize: 20))
                    ])),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                          ),
                          hintText: "Full name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "full name is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      TextSpan(
                          text: "*",
                          style: TextStyle(
                              color: Colors.deepOrangeAccent, fontSize: 20))
                    ])),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "No.Handphone",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      TextSpan(
                          text: "*",
                          style: TextStyle(
                              color: Colors.deepOrangeAccent, fontSize: 20))
                    ])),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApplyJobScreenSecond(),
                        ));
                  },
                  child: Text("Next")),
            ],
          ),
        ),
      ),
    );
  }
}
