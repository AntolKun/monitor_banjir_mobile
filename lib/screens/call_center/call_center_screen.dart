import 'package:flutter/material.dart';
import 'package:monitor_banjir/constants.dart';

class CallCenterScreen extends StatelessWidget {
  static String routeName = "/call_center";

  const CallCenterScreen({super.key});
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
          "Call Center",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          Container(
            child: Text("quarter  sd"),
          )
        ],
      ),
    );
  }
}
