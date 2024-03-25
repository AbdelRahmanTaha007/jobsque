import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/controllers/db/offline/shared_helper.dart';
import 'package:jobsque/controllers/portfolios/portfolios_cubit.dart';
import 'package:jobsque/views/bottom_nav_bar_screen/bottom_nav_bar.dart';
import 'package:jobsque/views/edit_profile_screen/edit_profile_screen.dart';
import 'package:jobsque/views/help_center_screen/help_center_screen.dart';
import 'package:jobsque/views/language_screen/language_screen.dart';
import 'package:jobsque/views/login_screen/login_screen.dart';
import 'package:jobsque/views/login_settings/login_settings.dart';
import 'package:jobsque/views/portfolio_screen/portfolio_screen.dart';
import 'package:jobsque/views/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:jobsque/views/settings_notifications_screen/settings_notifications_screen.dart';
import 'package:jobsque/views/terms_conditions_screen/terms_conditions_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const route = "profileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    PortfoliosCubit.get(context).getPortfolios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(214, 228, 255, 1),
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
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              SharedHelper.prefs.remove("accessToken");
              var token = SharedHelper.prefs.getString("accessToken");
              print(token);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset("assets/images/logout.png"),
            ),
          ),
        ],
      ),
      body: BlocConsumer<PortfoliosCubit, PortfoliosState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      final portfolio = PortfoliosCubit.get(context)
                          .portfoliosPortfolios[index];
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 120,
                              ),
                              Container(
                                height: 90,
                                color: Color.fromRGBO(214, 228, 255, 1),
                                // child: , Bara el Mawdooo3
                              ),
                              Positioned(
                                right: 155,
                                left: 155,
                                bottom: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    // width: 50,
                                    height: 67,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(portfolio.image!),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      // child: Image.network(
                                      //   "",
                                      //   width: 70,
                                      //   height: 60,
                                      //   fit: BoxFit.cover,
                                      // ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            portfolio.name!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Flutter Developer",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 350,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(250, 250, 250, 1),
                  ),
                  // color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Applied",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                          Text(
                            "46",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 2,
                          ))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Reviewed",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                          Text("23",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Expanded(child: Divider())],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Contacted",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                          Text("16",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("About",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 18)),
                      Text("Edit",
                          style:
                              TextStyle(color: Color(0xFF3366FF), fontSize: 14))
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                      "I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.",
                      style: TextStyle(color: Colors.grey, fontSize: 14)),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  width: 450,
                  height: 40,
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(229, 231, 235, 1)),
                  child: Text(
                    "General",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    width: 400,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(214, 228, 255, 1),
                                    borderRadius: BorderRadius.circular(35)),
                                child:
                                    Image.asset("assets/images/profile.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Edit Profile",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ],
                        ),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PortfolioScreen(),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    width: 400,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(214, 228, 255, 1),
                                    borderRadius: BorderRadius.circular(35)),
                                child: Image.asset(
                                    "assets/images/folder-favorite.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Portfolio",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ],
                        ),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LanguageScreen(),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    width: 400,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(214, 228, 255, 1),
                                    borderRadius: BorderRadius.circular(35)),
                                child: Image.asset("assets/images/global.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Language",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ],
                        ),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationSettingsScreen(),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    width: 400,
                    height: 70,
                    // decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(214, 228, 255, 1),
                                    borderRadius: BorderRadius.circular(35)),
                                child: Image.asset(
                                    "assets/images/notification.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Notification",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ],
                        ),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginSettings(),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    width: 400,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(214, 228, 255, 1),
                                    borderRadius: BorderRadius.circular(35)),
                                child: Image.asset("assets/images/lock.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Login and security",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ],
                        ),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  width: 450,
                  height: 40,
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(229, 231, 235, 1)),
                  child: Text(
                    "Others",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  //     onTap: () {
                  //   Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => (),
                  //           ));
                  // },
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    width: 400,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Accessibility",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpCenterScreen(),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    width: 400,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Help Center",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsConditionsScreen(),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    width: 400,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Terms & Conditions",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicyScreen(),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    width: 400,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Privacy policy",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
