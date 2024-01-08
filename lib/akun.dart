import 'package:flutter/material.dart';

class Akun extends StatefulWidget {
  const Akun({Key? key}) : super(key: key);
  
  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Akun'),
    );
  }
}