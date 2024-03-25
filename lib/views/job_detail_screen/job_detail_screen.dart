import 'package:flutter/material.dart';
import 'package:jobsque/views/apply_job_screen/apply_job_screen_first.dart';
import 'package:jobsque/views/bottom_nav_bar_screen/bottom_nav_bar.dart';

class JobDetailScreen extends StatefulWidget {
  String? compName;
  String? image;
  JobDetailScreen({
    super.key,
    required this.compName,
    required this.image,
    // required this.userId,
  });
  static const route = "jobDetailScreen";
  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  late String? _receivedName;
  late String? _receivedImage;
  // late String? _receivedUserId;
  // late String? _receivedJobId;

  @override
  void initState() {
    super.initState();
    _receivedName = widget.compName;
    _receivedImage = widget.image;
    print(_receivedName);
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Job Detail",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBarScreen(),
                  ));
            },
            child: Icon(Icons.arrow_back)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(
              Icons.archive_rounded,
              size: 40,
              color: Color(0xFF3366FF),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            children: [
              Center(
                child: Image.network(
                  _receivedImage!,
                  width: 80,
                  height: 80,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  _receivedName!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  "Twitter • Cairo,Egypt",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(214, 228, 255, 1),
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.all(8),
                    child: Text("Fulltime"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(214, 228, 255, 1),
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.all(8),
                    child: Text("Senior"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(214, 228, 255, 1),
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.all(9),
                    child: Text("Onsite"),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 244, 245, 1),
                    borderRadius: BorderRadius.circular(25)),
                width: 320,
                height: 60,
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: selectedIndex == 0
                                    ? Color.fromRGBO(2, 51, 122, 1)
                                    : Color.fromRGBO(244, 244, 245, 1),
                                borderRadius: BorderRadius.circular(25)),
                            height: 50,
                            padding: EdgeInsets.all(5),
                            child: Center(
                                child: Text(
                              "Descripton",
                              style: TextStyle(
                                  color: selectedIndex == 0
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: selectedIndex == 1
                                    ? Color.fromRGBO(2, 51, 122, 1)
                                    : Color.fromRGBO(244, 244, 245, 1),
                                borderRadius: BorderRadius.circular(25)),
                            height: 50,
                            padding: EdgeInsets.all(5),
                            child: Center(
                                child: Text(
                              "Company",
                              style: TextStyle(
                                  color: selectedIndex == 1
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                                color: selectedIndex == 2
                                    ? Color.fromRGBO(2, 51, 122, 1)
                                    : Color.fromRGBO(244, 244, 245, 1),
                                borderRadius: BorderRadius.circular(25)),
                            height: 50,
                            padding: EdgeInsets.all(5),
                            child: Center(
                                child: Text(
                              "People",
                              style: TextStyle(
                                  color: selectedIndex == 2
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18),
                            )),
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  (selectedIndex == 0)
                      ? Container(
                          padding: EdgeInsets.only(bottom: 140),
                          height: 400,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Job description",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "Your role as the UI Designer is to use interactive components on various platforms (web, desktop and mobile). This will include producing high-fidelity mock-ups, iconography, UI illustrations/graphics, and other graphic elements. As the UI Designer, you will be supporting the wider design team with the internal Design System, tying together the visual language. You will with other UI and UX Designers, Product Managers, and Engineering teams in a highly customer-focused agile environment to help define the vision of the products."),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Skill reqiured",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "A strong visual portfolio with clear understanding of UI methodologies\nAbility to create hi-fidelity mock-ups in Figma\nAbility to create various graphics for the web e.g. illustrations and icons\nAble to facilitate workshops and liaise with stakeholders\nProficiency in the Adobe Creative Suite\nConfident communicator with an analytical mindset\nDesign library/Design system experience\n4+ years of commercial experience in UI/Visual Design"),
                              ],
                            ),
                          ),
                        )
                      : (selectedIndex == 1)
                          ? Container(
                              height: 400,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Contact Us",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          height: 61,
                                          width: 160,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Email"),
                                              Text("twitter@gmail.com",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          height: 61,
                                          width: 160,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Website"),
                                              Text(
                                                "twitter.com",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "About Company",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                        "Understanding Recruitment is an award-winning technology, software and digital recruitment consultancy with headquarters in St. Albans, Hertfordshire.We also have a US office in Boston, Massachusetts specialising in working closely with highly skilled individuals seeking their next career move within Next Gen Tech, Backend Engineering, and Artificial Intelligence.We recently celebrated our first decade in business and over the years have been recognised with several industry awards including 'Best Staffing Firm to Work For 2018'​ at the SIA Awards for the third consecutive year and ‘Business of the Year 2017’ at the SME Hertfordshire Business Awards.Our teams of specialists operate across all areas of Technology and Digital, including Java, JavaScript, Python, .Net, DevOps & SRE, SDET, Artificial Intelligence, Machine Learning, AI, Digital, Quantum Computing, Hardware Acceleration, Digital, Charity, Fintech, and the Public Sector."),
                                    SizedBox(
                                      height: 150,
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              margin:
                                  EdgeInsets.only(top: 30, left: 10, right: 10),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "No. Employees For",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            Text("UI/UX Designer")
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Row(
                                            children: [
                                              Text(
                                                "UI/UX Designer",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                              Icon(Icons
                                                  .keyboard_arrow_down_sharp)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 25),
                                      height: 350,
                                      width: 400,
                                      child: ListView.builder(
                                        itemCount: 9,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            leading: Image.asset(
                                              "assets/images/Dimas Profile.png",
                                              width: 30,
                                              height: 50,
                                            ),
                                            title: Text("Name",
                                                style: TextStyle(fontSize: 16)),
                                            subtitle: Text("Position",
                                                style: TextStyle(fontSize: 16)),
                                            trailing: Column(
                                              children: [
                                                Text(
                                                  "Work during",
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                Text(
                                                  "5 years",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF3366FF)),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                  Positioned(
                      top: 250,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ApplyJobScreenFirst(),
                                ));
                          },
                          child: Text("Apply now")))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
