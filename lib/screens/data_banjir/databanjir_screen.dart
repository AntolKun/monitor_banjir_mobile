import 'package:flutter/material.dart';
import 'package:monitor_banjir/constants.dart';
import 'package:monitor_banjir/screens/data_banjir/components/listdata.dart';

class DataBanjirScreen extends StatelessWidget {
  static String routeName = "/data_banjir";

  const DataBanjirScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kPrimaryColorSoft,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        title: const Text(
          "Data Banjir",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text("Titik data banjir : ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              const ListDataBanjir(),
            ],
          ),
        ),
      ),
    );
  }
}
