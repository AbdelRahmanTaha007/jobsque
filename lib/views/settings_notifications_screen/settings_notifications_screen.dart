import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});
  static const route = "NotificationSettingsScreen";
  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool jobSearchAlert = false;
  bool jobApplicationUpdate = false;
  bool jobApplicationReminders = false;
  bool jobsYouMayBeInterestedIn = false;
  bool jobSeekerUpdates = false;
  bool showProfile = false;
  bool allMessages = false;
  bool messagesNudges = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                "Job notification",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildSwitchTile("Your Job Search Alert", jobSearchAlert, (value) {
              setState(() {
                jobSearchAlert = value;
              });
            }),
            SizedBox(
              height: 10,
            ),
            buildSwitchTile("Job Application Update", jobApplicationUpdate,
                (value) {
              setState(() {
                jobApplicationUpdate = value;
              });
            }),
            SizedBox(
              height: 10,
            ),
            buildSwitchTile(
                "Job Application Reminders", jobApplicationReminders, (value) {
              setState(() {
                jobApplicationReminders = value;
              });
            }),
            SizedBox(
              height: 10,
            ),
            buildSwitchTile(
                "Jobs You May Be Interested In", jobsYouMayBeInterestedIn,
                (value) {
              setState(() {
                jobsYouMayBeInterestedIn = value;
              });
            }),
            SizedBox(
              height: 10,
            ),
            buildSwitchTile("Job Seeker Updates", jobSeekerUpdates, (value) {
              setState(() {
                jobSeekerUpdates = value;
              });
            }),
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
                "Other notification",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildSwitchTile("Show Profile", showProfile, (value) {
              setState(() {
                showProfile = value;
              });
            }),
            SizedBox(
              height: 20,
            ),
            buildSwitchTile("All Messages", allMessages, (value) {
              setState(() {
                allMessages = value;
              });
            }),
            SizedBox(
              height: 20,
            ),
            buildSwitchTile("Message Nudges", messagesNudges, (value) {
              setState(() {
                messagesNudges = value;
              });
            }),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeColor: Color(0xFF3366FF),
          )
        ],
      ),
    );
  }
}
