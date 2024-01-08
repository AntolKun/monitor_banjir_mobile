import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Stack (
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Card (
              elevation: 0,
              color: const Color(0xFF86A7FC),
              child: SizedBox(
                width: 350,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/banjir.jpg',
                      width: 500,
                      height: 150,
                    )
                  ],
                ),
              ),
            )
          )
        ]
      )
    );
  }
}