import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_direct/AdminScreen/AdminScreen.dart';
import 'package:health_direct/layout/home_layout.dart';
import 'package:health_direct/modules/register_screen/register_screen.dart';
import 'package:health_direct/modules/register_screen/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_direct/modules/start_screen/start_screen.dart';
import 'package:health_direct/modules/reset_screen/reset_screen.dart';
import 'package:health_direct/utils/utils.dart';

class login_screen extends StatefulWidget {
  static const String ScreenRoute = 'login_sacreen';
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  //String role='user';
  final _auth = FirebaseAuth.instance;
 final _formKey = GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    void _checkrole()  async{
      final User? user = FirebaseAuth.instance.currentUser;
      final DocumentSnapshot snap = await FirebaseFirestore.instance.collection("Users").doc(user!.uid).get();
      /*setState(() {
        role=snap['role'];
      });*/
if (snap['role']=='user' ){
  Navigator.pushNamed(context, HomeLayout.ScreenRoute);
}
else if(snap['role']=='admin'){
Navigator.pushNamed(context,AdmainScreen.ScreenRoute);
}

    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF516091),
        title: Text(
          'Login',
          style: TextStyle(
            fontSize: 35.0,
            fontFamily:'Segoeuib',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children:
                [
                  Image.asset(
                    "assets/images/logo.png",
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                   
                    decoration: InputDecoration(
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
                        ),
                      ),
                       
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                      return "required";}
                      return null ;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                 
                    decoration: const InputDecoration(
                      labelText: 'Password',
            
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
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
                    validator: (value) {
                      if(value!.isEmpty){
                      return "required";}
                      return null ;
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:
                    [
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, reset_screen.ScreenRoute);
                        },
                        child: Text(
                            'Forgot password?',
                          style: TextStyle(
                            fontFamily: 'segoeui',
                            fontSize: 20.0,
                            color: Color(0xff848484),
                          ),
                        ),
                      ),
                    ],
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
                      onPressed: () async{
                        if(_formKey.currentState!.validate()){
                          
                        try {

                      final user = await _auth.signInWithEmailAndPassword(
                        email: emailController.text.toString(),
                         password: passwordController.text.toString()).then((value) {}).onError((error, stackTrace) {
                          Utils().toastMessage(error.toString());
                         });
                        // function
                      //Navigator.pushNamed(context, HomeLayout.ScreenRoute);
                      _checkrole();
                      
                    if (user != null){
                     Navigator.pushNamed(context ,start_screen.ScreenRoute);
                    }
                    } catch (e) {
                    
    }}},
                      
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontFamily: 'segoeui',
                          color: Color(0xff516091),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        "Don't have account?",
                        style: TextStyle(
                          fontFamily: 'segoeui',
                          fontSize: 20.0,
                          color: Color(0xff848484),
                        ),
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      InkWell(
                        onTap: ( ){
                          Navigator.pushNamed(context ,register_screen.ScreenRoute);
                          
                          
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'segoeui',
                            fontSize: 20.0,
                            color: Color(0xff516091),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
  