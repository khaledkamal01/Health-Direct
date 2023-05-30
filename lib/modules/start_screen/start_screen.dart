import 'package:flutter/material.dart';
import 'package:health_direct/shared/component/component.dart';
import 'package:health_direct/modules/login_screen/login_screen.dart';
import 'package:health_direct/modules/register_screen/register_screen.dart';

class start_screen extends StatefulWidget {
  static const String ScreenRoute = 'start_screen';
  const start_screen({super.key});

  @override
  State<start_screen> createState() => _start_screenState();
}

class _start_screenState extends State<start_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF516091),
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 35.0,
            fontFamily:'Segoeuib',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Image.asset(
                "assets/images/logo.png",
            ),
            SizedBox(
              height: 20.0,
            ),
            defaultButton(
                text: 'login',
                function: (){
                  Navigator.pushNamed(context ,login_screen.ScreenRoute);
                },
              width: double.infinity,
              height: 60.0,
              radius: 60.0,
              background: Color(0xFF516091),
              isUpperCase: true,
              fontSize: 30.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OR',
                  style: TextStyle(
                    color: Color(0xFF516091),
                    fontSize: 35.0,
                    fontFamily:'Segoeuib',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: (){
                 Navigator.pushNamed(context ,register_screen.ScreenRoute);
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xFF516091),width: 3.0),
                    borderRadius: BorderRadius.circular(60.0),
                ),
                child: Center(
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                      color: Color(0xFF516091),
                      fontSize: 30.0,
                      fontFamily:'Segoeuib',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );}}