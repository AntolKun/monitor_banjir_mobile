import 'package:flutter/material.dart';

class Banjir extends StatefulWidget {
  const Banjir({Key? key}) : super(key: key);
  
  @override
  State<Banjir> createState() => _BanjirState();
}

class _BanjirState extends State<Banjir> {

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Banjir'),
    );
  }
}