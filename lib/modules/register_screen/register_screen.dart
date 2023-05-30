


import 'package:flutter/material.dart';
import 'package:health_direct/modules/login_screen/login_screen.dart';
import 'package:health_direct/shared/component/component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_direct/utils/utils.dart';
class register_screen extends StatefulWidget {
    static const String ScreenRoute = 'register_screen';
  const register_screen({super.key});

  @override
  State<register_screen> createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> {
  User? user = FirebaseAuth.instance.currentUser;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
   String? FirstName;
    String? LastName;
    late String Email;
    String? Phone;
    late String Password;
    String? ConfirmPassword;
    String? Address;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = new GlobalKey<FormState>();
    send(){
      var formdata = formstate.currentState;
      if (formdata!.validate()){
        print("not valid");

      }
      else{
        
        formdata.save();
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF516091),
        title: Text(
          'SignUp',
          style: TextStyle(
            fontSize: 35.0,
            fontFamily:'Segoeuib',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
               key: formstate,
              child: Column(
                children:
                [
                  Image.asset(
                    "assets/images/logo.png",
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          subtitle: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(60.0),
                                  ),
                                borderSide: BorderSide(
                                  color: Color(0xFF516091),
                                  width: 10.0,
                                ),
                              ),
                              labelText: 'First Name',
                            ),
                            onChanged: (value) {
                              FirstName=value;
                            },
                            validator: (value) {
                        if(value!.isEmpty){
                          return "Required";
                        }
                      },
                          ),
                        ),
                      ),
                      Expanded(
                        child:ListTile(
                          subtitle:  TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(60.0)
                                  )
                              ),
                              labelText: 'Last Name',
                            ),
                            onChanged: (value) {
                              LastName=value;
                            },
                            validator: (value) {
                        if(value!.isEmpty){
                          return "Required";
                        }
                      },
                          ),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(60.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFF516091),
                          width: 10.0,
                        ),
                      ),
                      labelText: 'Email',
                    ),
                    onChanged: (value) {
                      Email= value;
                    },
                    validator: (value) {
                        if(value!.isEmpty){
                          return "Required";
                        }
                        //else if(!value.contains("@") || !value.contains(".com")){
                         // return "The email address is badly formatted";
                       // }
                    
                       
                      },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(60.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFF516091),
                          width: 10.0,
                        ),
                      ),
                      labelText: 'Mobile Number',
                    ),
                    onChanged: (value) {
                      Phone=value;
                    },
                    validator: (value) {
                        if(value!.isEmpty){
                          return "Required";
                        }
                        else if("$value".length < 10){
                    return ("the number is not valid");
                  }
                 },
                        
                      
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(60.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFF516091),
                          width: 10.0,
                        ),
                      ),
                      labelText: 'Address',
                    ),
                    onChanged: (value) {
                      Address=value;
                    },
                    validator: (value) {
                        if(value!.isEmpty){
                          return "Required";
                        }
                      },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(60.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFF516091),
                          width: 10.0,
                        ),
                      ),
                      labelText: 'Password',
                    ),
                    onChanged: (value) {
                      Password=value;
                    },
                    validator: (value) {
                        if(value!.isEmpty){
                          return "Required";
                        }
                      },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(obscureText: true,
                    decoration: const InputDecoration(
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(60.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFF516091),
                          width: 10.0,
                        ),
                      ),
                      labelText: 'Confirm Password',
                    ),
                    onChanged: (value) {
                      ConfirmPassword=value;
                    },
                    validator: (value) {
                        if(value!.isEmpty){
                          return "Required";
                        }
                        if(Password!=ConfirmPassword){
                          return "The passwords not matches";
                        }
                      },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultButton(
                    text: 'Sign Up',
                    function: () async{
                       send();
                       if("$Password" == "$ConfirmPassword" && "$Phone".length == 10){
                
                
                try {
                    final newUser;
                    newUser =  await _auth.createUserWithEmailAndPassword(
                      email: Email, 
                      password: Password).then((value){
                      
                      }).onError((error, stackTrace) {
                        Utils().toastMessage(error.toString());
                      });
                   await  _firestore.collection('Users').doc(_auth.currentUser!.uid).set({
                   'id' :_auth.currentUser!.uid,
                  'FirstName':FirstName,
                  'LastName':LastName,
                  'Email':Email,
                  'Phone':Phone,
                  'Password':Password,
                  'ConfirmPassword':ConfirmPassword,
                  'Address':Address,
                  'role':'user',
        
                });
                    Navigator.pushNamed(context, login_screen.ScreenRoute);
                  } catch (e) {
                    print(e);
                  };
                  
                   }
                   else
                    return null;
                
                    },
                    width: double.infinity,
                    height: 60.0,
                    radius: 60.0,
                    background: Color(0xFF516091),
                    isUpperCase: true,
                    fontSize: 30.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }}