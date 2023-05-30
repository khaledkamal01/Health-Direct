import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class reset_screen extends StatefulWidget {
  static const String ScreenRoute = 'reset_screen';
  const reset_screen({super.key});

  @override
  State<reset_screen> createState() => _reset_screenState();
}

class _reset_screenState extends State<reset_screen> {
   final _auth = FirebaseAuth.instance;
  late String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF516091),
        title: Text(
          'Forgot password',
          style: TextStyle(
            fontSize: 35.0,
            fontFamily:'Segoeuib',
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children:
              [
                Text(
                  'Forgot password',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'segoeuib',
                    fontSize: 40.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Please enter your email',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'segoeui',
                    fontSize: 25.0,
                  ),
                ),
                Text(
                  'to reset your password',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'segoeui',
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                 
                  onChanged: (value) {
                    email=value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(60.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFF516091),
                        width: 10.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    border: Border.all(
                      color: Color(0xff516091),
                      width: 2.0,
                    ),
                  ),
                  child: MaterialButton(
                    height: 50.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0)
                    ),
                    color: Colors.white,
                    elevation: 0.0,
                    onPressed: (){
                    _auth.sendPasswordResetEmail(email: email);
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(
                          fontSize: 35.0,
                          fontFamily: 'segoeui',
                          color: Color(0xff516091),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
  