import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/controllers/applied_jobs_cubit/applied_job_cubit.dart';
import 'package:jobsque/views/apply_job_screen/apply_job_screen_first.dart';
import 'package:jobsque/views/bottom_nav_bar_screen/bottom_nav_bar.dart';

class AppliedJobScreen extends StatefulWidget {
  const AppliedJobScreen({super.key});
  static const route = "AppliedJobScreen";
  @override
  State<AppliedJobScreen> createState() => _AppliedJobScreenState();
}

class _AppliedJobScreenState extends State<AppliedJobScreen> {
  @override
  void initState() {
    super.initState();
    AppliedJobCubit.get(context).getAppliedJobs();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Applied Job",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBarScreen(),
                  ));
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 244, 245, 1),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: (selectedIndex == 0)
                            ? Color.fromRGBO(9, 26, 122, 1)
                            : Color.fromRGBO(244, 244, 245, 1),
                      ),
                      width: 175,
                      height: 50,
                      child: Center(
                          child: Text(
                        "Active",
                        style: TextStyle(
                            color: (selectedIndex == 0)
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: (selectedIndex == 1)
                            ? Color.fromRGBO(9, 26, 122, 1)
                            : Color.fromRGBO(244, 244, 245, 1),
                      ),
                      width: 175,
                      height: 50,
                      child: Center(
                          child: Text(
                        "Rejected",
                        style: TextStyle(
                            color: (selectedIndex == 1)
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            (selectedIndex == 0)
                ? Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        width: 450,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(229, 231, 235, 1)),
                        child: Text(
                          "${AppliedJobCubit.get(context).appliedJobs.length} Jobs",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      BlocConsumer<AppliedJobCubit, AppliedJobState>(
                        builder: (context, state) {
                          if (state is LoadingGetAppliedJobsState) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is FailedGetAppliedJobsState) {
                            return Text("Error");
                          }
                          return Container(
                              margin: EdgeInsets.only(left: 15, right: 15),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: AppliedJobCubit.get(context)
                                    .appliedJobs
                                    .length,
                                itemBuilder: (BuildContext context, int index) {
                                  final job = AppliedJobCubit.get(context)
                                      .appliedJobs[index];

                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey)),
                                      // borderRadius: BorderRadius.circular(15),
                                    ),
                                    width: 360,
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/discord.png",
                                                width: 60,
                                                height: 60,
                                                fit: BoxFit.fill,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    job.name!,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    job.email!,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              // const SizedBox(
                                              //   width: 155,
                                              // ),
                                              const Icon(
                                                Icons.bookmark_outline_sharp,
                                                size: 30,
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Center(
                                                      child: Text(job.workType!,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF3366FF))),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              214, 228, 255, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    width: 70,
                                                    height: 30,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    child: Center(
                                                        child: Text(
                                                      job.workType!,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF3366FF)),
                                                    )),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              214, 228, 255, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    width: 70,
                                                    height: 30,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              ),
                                              const Text("Posted 2 days ago")
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            height: 100,
                                            width: 350,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ApplyJobScreenFirst(),
                                                        ));
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 4,
                                                                bottom: 4),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          color:
                                                              Color(0xFF3366FF),
                                                        ),
                                                        child: Text(
                                                          "1",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        "Bio data",
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Expanded(
                                                  child: Divider(
                                                    color: Color(0xFF3366FF),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ApplyJobScreenFirst(),
                                                        ));
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 4,
                                                                bottom: 4),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          color:
                                                              Color(0xFF3366FF),
                                                        ),
                                                        child: Text(
                                                          "2",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        "Bio data",
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Expanded(
                                                  child: Divider(
                                                    color: Color(0xFF3366FF),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ApplyJobScreenFirst(),
                                                        ));
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 4,
                                                                bottom: 4),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          // color: Color(0xFF3366FF),
                                                        ),
                                                        child: Text(
                                                          "3",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        "Bio data",
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ));
                        },
                        listener: (context, state) {},
                      )
                    ],
                  )
                :
                //Rejected Page
                Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Image.asset("assets/images/Data Ilustration(2).png"),
                        SizedBox(height: 15),
                        Text(
                          "No applications were rejected",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          "If there is an application that is rejected by the company it will appear here",
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}


// Container(
//                         height: 700,
//                         margin: EdgeInsets.only(left: 15, right: 15),
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return 
//                             Container(
//                               height: 700,
//                               width: 450,
//                               child:
// ListView.builder(
//                                 physics: NeverScrollableScrollPhysics(),
//                                 scrollDirection: Axis.vertical,
//                                 shrinkWrap: true,
//                                 itemCount: 20,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return
//                                    Container(
//                                     decoration: BoxDecoration(
//                                       border: Border(
//                                           bottom:
//                                               BorderSide(color: Colors.grey)),
//                                       // borderRadius: BorderRadius.circular(15),
//                                     ),
//                                     width: 300,
//                                     margin: const EdgeInsets.only(right: 10),
//                                     child: Container(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Image.asset(
//                                                 "assets/images/Zoom Logo.png",
//                                                 width: 50,
//                                                 height: 60,
//                                                 fit: BoxFit.fill,
//                                               ),
//                                               const SizedBox(
//                                                 width: 15,
//                                               ),
//                                               const Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     "Job title",
//                                                     style: TextStyle(
//                                                         fontSize: 18,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                   Text(
//                                                     "Name . Country",
//                                                     style: TextStyle(
//                                                       fontSize: 14,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(
//                                                 width: 155,
//                                               ),
//                                               const Icon(
//                                                 Icons.bookmark_outline_sharp,
//                                                 size: 30,
//                                               )
//                                             ],
//                                           ),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Container(
//                                                     child: const Center(
//                                                       child: Text("Fulltime",
//                                                           textAlign:
//                                                               TextAlign.center,
//                                                           style: TextStyle(
//                                                               color: Color(
//                                                                   0xFF3366FF))),
//                                                     ),
//                                                     decoration: BoxDecoration(
//                                                       color:
//                                                           const Color.fromRGBO(
//                                                               214, 228, 255, 1),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               15),
//                                                     ),
//                                                     width: 70,
//                                                     height: 30,
//                                                   ),
//                                                   const SizedBox(
//                                                     width: 5,
//                                                   ),
//                                                   Container(
//                                                     child: const Center(
//                                                         child: Text(
//                                                       "Remote",
//                                                       style: TextStyle(
//                                                           color: Color(
//                                                               0xFF3366FF)),
//                                                     )),
//                                                     decoration: BoxDecoration(
//                                                       color:
//                                                           const Color.fromRGBO(
//                                                               214, 228, 255, 1),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               15),
//                                                     ),
//                                                     width: 70,
//                                                     height: 30,
//                                                   ),
//                                                   const SizedBox(
//                                                     width: 5,
//                                                   ),
//                                                 ],
//                                               ),
//                                               const Text("Posted 2 days ago")
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 15,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.all(10),
//                                             decoration: BoxDecoration(
//                                                 border: Border.all(
//                                                   color: Colors.grey,
//                                                 ),
//                                                 borderRadius:
//                                                     BorderRadius.circular(5)),
//                                             height: 100,
//                                             width: 350,
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 InkWell(
//                                                   onTap: () {
//                                                     Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               ApplyJobScreenFirst(),
//                                                         ));
//                                                   },
//                                                   child: Column(
//                                                     children: [
//                                                       Container(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                                 left: 10,
//                                                                 right: 10,
//                                                                 top: 4,
//                                                                 bottom: 4),
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(50),
//                                                           color:
//                                                               Color(0xFF3366FF),
//                                                         ),
//                                                         child: Text(
//                                                           "1",
//                                                           style: TextStyle(
//                                                               fontSize: 16,
//                                                               color:
//                                                                   Colors.white),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 15,
//                                                       ),
//                                                       Text(
//                                                         "Bio data",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   width: 30,
//                                                 ),
//                                                 Expanded(
//                                                   child: Divider(
//                                                     color: Color(0xFF3366FF),
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   width: 30,
//                                                 ),
//                                                 InkWell(
//                                                   onTap: () {
//                                                     Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               ApplyJobScreenFirst(),
//                                                         ));
//                                                   },
//                                                   child: Column(
//                                                     children: [
//                                                       Container(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                                 left: 10,
//                                                                 right: 10,
//                                                                 top: 4,
//                                                                 bottom: 4),
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(50),
//                                                           color:
//                                                               Color(0xFF3366FF),
//                                                         ),
//                                                         child: Text(
//                                                           "2",
//                                                           style: TextStyle(
//                                                               fontSize: 16,
//                                                               color:
//                                                                   Colors.white),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 15,
//                                                       ),
//                                                       Text(
//                                                         "Bio data",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   width: 30,
//                                                 ),
//                                                 Expanded(
//                                                   child: Divider(
//                                                     color: Color(0xFF3366FF),
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   width: 30,
//                                                 ),
//                                                 InkWell(
//                                                   onTap: () {
//                                                     Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               ApplyJobScreenFirst(),
//                                                         ));
//                                                   },
//                                                   child: Column(
//                                                     children: [
//                                                       Container(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                                 left: 10,
//                                                                 right: 10,
//                                                                 top: 4,
//                                                                 bottom: 4),
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           border: Border.all(),
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(50),
//                                                           // color: Color(0xFF3366FF),
//                                                         ),
//                                                         child: Text(
//                                                           "3",
//                                                           style: TextStyle(
//                                                               fontSize: 16,
//                                                               color:
//                                                                   Colors.grey),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 15,
//                                                       ),
//                                                       Text(
//                                                         "Bio data",
//                                                         style: TextStyle(
//                                                             fontSize: 12),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 15,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//                       )