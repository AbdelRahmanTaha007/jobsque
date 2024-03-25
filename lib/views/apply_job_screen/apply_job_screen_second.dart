import 'package:flutter/material.dart';
import 'package:jobsque/views/apply_job_screen/apply_job_screen_third.dart';

class ApplyJobScreenSecond extends StatefulWidget {
  const ApplyJobScreenSecond({super.key});
  static const route = "applyJobSecond";
  @override
  State<ApplyJobScreenSecond> createState() => _ApplyJobScreenSecondState();
}

class _ApplyJobScreenSecondState extends State<ApplyJobScreenSecond> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  var groupValue = "Senior UX Designer";
  List<String> jobs = [
    "Senior UX Designer",
    "Senior UI Designer",
    "Graphic Designer",
    "Front-End Developer",
  ];
  String selectedRadio = "";
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
                          border: Border.all(color: Color(0xFF3366FF)),
                          borderRadius: BorderRadius.circular(50),
                          // color: Color(0xFF3366FF),
                        ),
                        child: Text(
                          "2",
                          style:
                              TextStyle(fontSize: 24, color: Color(0xFF3366FF)),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Type of work",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF3366FF)),
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
                "Type of work",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text("Fill in your bio data correctly"),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: (jobs[index] == groupValue)
                                ? Color.fromRGBO(214, 228, 255, 1)
                                : Colors
                                    .white, // color: (selectedRadio == jobs[index])
                            //     ? Colors.amber
                            //     : Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(
                            jobs[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          subtitle: Text(
                            "CV.pdf . portfolio.pdf",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          trailing: Radio(
                            fillColor:
                                MaterialStatePropertyAll(Color(0xFF3366FF)),
                            value: jobs[index],
                            groupValue: groupValue,
                            onChanged: ((value) {
                              setState(() {
                                groupValue = value!;
                              });
                            }),
                          ),
                        ));
                  },
                ),
              ),
              // SizedBox(
              //   height: ,
              // ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApplyJobScreenThird(),
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
