import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AdmainScreen extends StatefulWidget {
  static const String ScreenRoute = 'AdminScreen';
  const AdmainScreen({super.key});

  @override
  State<AdmainScreen> createState() => _AdmainScreenState();
}

class _AdmainScreenState extends State<AdmainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Text("AdminScreen"))),
    );
  }
}