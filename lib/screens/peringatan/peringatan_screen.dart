import 'package:flutter/material.dart';
import 'package:monitor_banjir/constants.dart';
import 'package:monitor_banjir/screens/peringatan/components/maps_page.dart';

class PeringatanScreen extends StatelessWidget {
  static String routeName = "/peringatan";

  const PeringatanScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColorSoft,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        title: const Text(
          "Peta Banjir",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: const MapsPage(),
    );
  }
}
