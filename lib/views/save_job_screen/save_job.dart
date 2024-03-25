import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/controllers/saved_jobs/saved_jobs_cubit.dart';
import 'package:jobsque/views/bottom_nav_bar_screen/bottom_nav_bar.dart';

class SaveJobScreen extends StatefulWidget {
  SaveJobScreen({super.key});
  static const route = "saveJobScreen";

  @override
  State<SaveJobScreen> createState() => _SaveJobScreenState();
}

class _SaveJobScreenState extends State<SaveJobScreen> {
  bool isThereData = false;
  @override
  void initState() {
    super.initState();
    SavedJobsCubit.get(context).getSavedJobs();
  }

  Widget build(BuildContext context) {
    int JobsCount = SavedJobsCubit.get(context).savedJobs.length;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBarScreen(),
                  ));
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          "Saved",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<SavedJobsCubit, SavedJobsState>(
        listener: (context, state) {
          if (state is SuccessGetSavedJobsState) {
            print(state);
          }
          if (state is ErrorGetSavedJobsState) {
            print(state);
          }
        },
        builder: (context, state) {
          if (state is SuccessGetSavedJobsState) {
            // return (isThereData == true)
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    width: 450,
                    height: 40,
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(229, 231, 235, 1)),
                    child: Center(
                      child: Text(
                        "$JobsCount jobs saved",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      width: 400,
                      margin: EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: SavedJobsCubit.get(context).savedJobs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final savedJobitem =
                              SavedJobsCubit.get(context).savedJobs[index];
                          print(SavedJobsCubit.get(context).savedJobs[index]);
                          print(savedJobitem);
                          return Container(
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                            padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                            width: 300,
                            height: 125,
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide())),
                            child: Row(children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.network(
                                            savedJobitem.image!,
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 150,
                                                child: Text(
                                                  savedJobitem.jobs!.name!,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              // Text(
                                              //   ,
                                              //   style: TextStyle(
                                              //       fontSize: 18,
                                              //       fontWeight: FontWeight.bold),
                                              // ),
                                              Text(
                                                  savedJobitem.jobs!.compName!),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 110,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                width: 450,
                                                height: 250,
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 6,
                                                                right: 6),
                                                        width: 350,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(
                                                                    "assets/images/directbox-notif.png"),
                                                                Text(
                                                                  "Apply Job",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                            Icon(Icons
                                                                .arrow_forward_ios_sharp)
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 6,
                                                                right: 6),
                                                        width: 350,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(
                                                                    "assets/images/export.png"),
                                                                SizedBox(
                                                                    width: 10),
                                                                Text(
                                                                  "Share via...",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                            Icon(Icons
                                                                .arrow_forward_ios_sharp)
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 6,
                                                                right: 6),
                                                        width: 350,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(
                                                                    "assets/images/archive-minus.png"),
                                                                SizedBox(
                                                                    width: 10),
                                                                Text(
                                                                  "Cancel save",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                            Icon(Icons
                                                                .arrow_forward_ios_sharp)
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          child: Image.asset(
                                              "assets/images/more.png"),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Posted 2 days ago"),
                                      SizedBox(
                                        width: 55,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("Be an early applicant"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Expanded(child: Divider())
                                ],
                              ),
                            ]),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ErrorGetSavedJobsState) {
            return Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/Saved Ilustration.png"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Nothing has been saved yet",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Press the star icon on the job you want to save.")
                  ],
                ),
              ),
            );
          } else if (state is LoadingGetSavedJobsState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
