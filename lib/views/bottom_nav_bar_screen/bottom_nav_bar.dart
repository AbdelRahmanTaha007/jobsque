import 'package:flutter/material.dart';
import 'package:jobsque/views/applied_job_screen/applied_job_screen.dart';
import 'package:jobsque/views/home_screen/home_screen.dart';
import 'package:jobsque/views/messages_screen/messages_menu_screen.dart';
import 'package:jobsque/views/profile_screen/profile_screen.dart';
import 'package:jobsque/views/save_job_screen/save_job.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});
  static const String route = "bottomNavigationBar";

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  @override
  List<Widget> screens = [
    const HomeScreen(),
    MessagesMenuScreen(),
    const AppliedJobScreen(),
    SaveJobScreen(),
    const ProfileScreen(),
  ];
  int selectedIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          backgroundColor: Colors.white,
          onTap: (val) {
            setState(() {
              selectedIndex = val;
              print(val);
            });
          },
          currentIndex: selectedIndex,
          selectedItemColor: Color(0xFF3366FF),
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: (selectedIndex == 0)
                    ? Image.asset("assets/images/blue home.png")
                    : Image.asset("assets/images/white home.png"),
                label: "Home"),
            BottomNavigationBarItem(
                icon: (selectedIndex == 1)
                    ? Image.asset("assets/images/blue messages.png")
                    : Image.asset("assets/images/white messages.png"),
                label: "Messages"),
            BottomNavigationBarItem(
                icon: (selectedIndex == 2)
                    ? Image.asset("assets/images/blue applied.png")
                    : Image.asset("assets/images/white applied.png"),
                label: "Applied"),
            BottomNavigationBarItem(
                icon: (selectedIndex == 3)
                    ? Image.asset("assets/images/blue favorite.png")
                    : Image.asset("assets/images/white favorite.png"),
                label: "Favorites"),
            BottomNavigationBarItem(
                icon: (selectedIndex == 4)
                    ? Image.asset("assets/images/blue person.png")
                    : Image.asset("assets/images/white person.png"),
                label: "Profile"),
          ]),
      body: screens[selectedIndex],
    );
  }
}
