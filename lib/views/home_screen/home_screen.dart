import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/controllers/Jobs_cubit/jobs_cubit.dart';
import 'package:jobsque/controllers/Profile/profile_cubit.dart';
import 'package:jobsque/controllers/db/offline/shared_helper.dart';
import 'package:jobsque/controllers/saved_jobs/saved_jobs_cubit.dart';
import 'package:jobsque/views/job_detail_screen/job_detail_screen.dart';
import 'package:jobsque/views/notification_screen/notification_screen.dart';
import 'package:jobsque/views/search_screen/search_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const route = "homeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    JobsCubit.get(context).getJobs();
    ProfileCubit.get(context).getProfile();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocConsumer<ProfileCubit, ProfileState>(
                          listener: (context, state) {
                            if (state is SuccessGetProfileState) {
                              print(state);
                            }
                            if (state is ErrorGetProfileState) {
                              print(state);
                            }
                          },
                          builder: (context, state) {
                            return Container(
                              height: 30,
                              width: 300,
                              child: ListView.builder(
                                itemCount:
                                    ProfileCubit.get(context).profile.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final profile =
                                      ProfileCubit.get(context).profile[index];
                                  print(profile);
                                  return Text(
                                    "Hi, ${profile.name!}👋",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Create a better future for yourself here",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.all(7),
                        child: const Icon(Icons.notifications_none_outlined),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ));
                  },
                  child: Container(
                    height: 60,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45)),
                        hintText: "Search...",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Suggested Jobs",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(color: Color(0xFF3366FF)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocConsumer<JobsCubit, JobsState>(
                  builder: (context, state) {
                    if (state is SuccessGetJobsState) {
                      print(state);
                      return Container(
                        height: 250,
                        width: 450,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: JobsCubit.get(context).jobs.length,
                          itemBuilder: (BuildContext context, int index) {
                            final jobitem = JobsCubit.get(context).jobs[index];
                            // final profileData =
                            //                       SavedJobsCubit.get(context)
                            //                           .savedJobs[index];
                            // print(JobsCubit.get(context).jobs[index]);
                            // print(JobsCubit.get(context).jobs.length);
                            // //COMPANY INFO
                            // print(jobitem.aboutComp);
                            // print(jobitem.compEmail);
                            // print(jobitem.compName);
                            // print(jobitem.compWebsite);
                            // print(jobitem.createdAt);
                            // print(jobitem.expired);
                            // print(jobitem.favorites);
                            // print(jobitem.id);
                            // //JOB INFO
                            // print(jobitem.jobDescription);
                            // print(jobitem.jobLevel);
                            // print(jobitem.jobSkill);
                            // print(jobitem.jobTimeType);
                            // print(jobitem.jobType);
                            // print(jobitem.location);
                            // print(jobitem.name);
                            // print(jobitem.salary);
                            // print(jobitem.updatedAt);
                            print(SharedHelper.prefs.getString('accessToken'));
                            return Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: 300,
                                margin: const EdgeInsets.only(right: 10),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 3, top: 5, bottom: 5, left: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: Image.network(
                                              jobitem.image!,
                                              width: 50,
                                              height: 60,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 150,
                                                  child: Text(
                                                    jobitem.name!,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  jobitem.compName!,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              final profileData =
                                                  SavedJobsCubit.get(context)
                                                      .savedJobs[index];
                                              final jobData =
                                                  JobsCubit.get(context)
                                                      .jobs[index];

                                              SavedJobsCubit.get(context)
                                                  .addFavourites(
                                                userId: profileData.id!,
                                                jobId: jobData.id!,
                                              );
                                              print(profileData.id);
                                              print(jobData.id);
                                            },
                                            child: Container(
                                              child: Image.asset(
                                                "assets/images/archive-minus.png",
                                                fit: BoxFit.fill,
                                                width: 30,
                                                height: 30,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      //job Skills Row
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Center(
                                              child: Text(jobitem.jobType!,
                                                  textAlign: TextAlign.center),
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  214, 228, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            width: 90,
                                            height: 40,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            child: Center(
                                                child:
                                                    Text(jobitem.jobTimeType!)),
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  214, 228, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            width: 90,
                                            height: 40,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            child: Center(
                                                child: Text(jobitem.jobLevel!)),
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  214, 228, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            width: 90,
                                            height: 40,
                                          ),
                                        ],
                                      ),
                                      //Salary and Apply Row
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text.rich(TextSpan(children: [
                                            TextSpan(
                                              text: "\$${jobitem.salary!}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            TextSpan(text: "/Month"),
                                          ])),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        JobDetailScreen(
                                                      compName: jobitem.name,
                                                      image: jobitem.image,

                                                      // jobId: jobitem.id!,
                                                      // userId: profileData.id!,
                                                    ),
                                                  ));
                                            },
                                            child: const Text("Apply now"),
                                            style: ButtonStyle(
                                                minimumSize:
                                                    MaterialStateProperty.all(
                                                        const Size(
                                                            20.0, 40.0))),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state is ErrorGetJobsState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                  listener: (context, state) {
                    if (state is ErrorGetJobsState) {
                      print(state);
                    } else if (state is SuccessGetJobsState) {
                      print(state);
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Jobs",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(color: Color(0xFF3366FF)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocConsumer<JobsCubit, JobsState>(
                  listener: (context, state) {
                    if (state is ErrorGetJobsState) {
                      print(state);
                    } else if (state is SuccessGetJobsState) {
                      print(state);
                    }
                  },
                  builder: (context, state) {
                    return Container(
                      height: 500,
                      width: 450,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: JobsCubit.get(context).jobs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final jobitem = JobsCubit.get(context).jobs[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 300,
                            margin: const EdgeInsets.only(right: 10),
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.network(
                                            jobitem.image!,
                                            width: 50,
                                            height: 50,
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
                                                jobitem.name!,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                jobitem.compName!,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // const SizedBox(
                                      //   width: 155,
                                      // ),
                                      Image.asset(
                                        "assets/images/white favorite.png",
                                        fit: BoxFit.fill,
                                        width: 30,
                                        height: 30,
                                      )
                                      // const Icon(
                                      //   Icons.archive_outlined,
                                      //   size: 30,
                                      // )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
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
                                              child: Text(jobitem.jobType!,
                                                  textAlign: TextAlign.center),
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  214, 228, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            width: 75,
                                            height: 30,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            child: Center(
                                                child: Text(jobitem.jobLevel!)),
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  214, 228, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            width: 50,
                                            height: 30,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            child: Center(
                                                child:
                                                    Text(jobitem.jobTimeType!)),
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  214, 228, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            width: 75,
                                            height: 30,
                                          ),
                                        ],
                                      ),
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                          text: "\$${jobitem.salary!}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.green),
                                        ),
                                        TextSpan(text: "/Month"),
                                      ])),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
