import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'akun.dart';
import 'banjir.dart';
import 'dashboard.dart';
import 'notifikasi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedScreen(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        color: Color(0xFF86A7FC),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10),
          
          child: GNav(
          backgroundColor: const Color(0xFF86A7FC),
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.pink.shade200,
          gap: 5,
          padding: const EdgeInsets.all(20),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home'
            ),
            GButton(
              icon: Icons.warning,
              text: 'Banjir'
              ),
            GButton(
              icon: Icons.notifications,
              text: 'Notifikasi'
              ),
            GButton(
              icon: Icons.person,
              text: 'Akun'
              ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          ),
        ),
      )
    );
  }

  Widget _getSelectedScreen(int index) {
    switch (index) {
      case 0:
        return const Dashboard();
      case 1:
        return const Banjir();
      case 2:
        return const Notifikasi();
      case 3:
        return const Akun();
      default:
        return const Dashboard();
    }
  }
}