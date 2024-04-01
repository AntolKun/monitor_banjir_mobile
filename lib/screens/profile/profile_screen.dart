import 'package:flutter/material.dart';
import 'package:monitor_banjir/screens/profile/components/listdarurat.dart';

import 'components/profile_menu.dart';
// import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 100),
            // const ProfilePic(),
            // const SizedBox(height: 20),
            // ProfileMenu(
            //   text: "My Account",
            //   icon: "assets/icons/User Icon.svg",
            //   press: () => {},
            // ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            // ProfileMenu(
            //   text: "Help Center",
            //   icon: "assets/icons/Question mark.svg",
            //   press: () {},
            // ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  alignment: Alignment.center,
                  child: const Text("Darurat Hubungi : ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                ListDarurat(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
