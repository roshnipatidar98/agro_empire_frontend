import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: 100,
        width: 100,
        color: Colors.black,
      )
    );
  }
}
