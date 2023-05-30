import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_direct/AdminScreen/AdminScreen.dart';
import 'package:health_direct/modules/add_item_screen/add_item_screen.dart';
import 'package:health_direct/modules/home_screen/home_screen.dart';
import 'package:health_direct/modules/login_screen/login_screen.dart';
import 'package:health_direct/modules/modify_item_screen/modify_item_screen.dart';
import 'package:health_direct/modules/register_screen/register_screen.dart';
import 'package:health_direct/modules/start_screen/start_screen.dart';
import 'package:health_direct/modules/reset_screen/reset_screen.dart';
import 'package:health_direct/modules/categories_screen/categories_screen.dart';
import 'package:health_direct/layout/home_layout.dart';
import 'package:health_direct/products/Beauty_care.dart';
import 'package:health_direct/products/Health%20&%20Wellness.dart';
import 'package:health_direct/products/Health & Wellness.dart';
import 'package:health_direct/products/Medicines & Treatments.dart';
import 'package:health_direct/products/Mum And Baby.dart';
import 'package:health_direct/products/Personal Care.dart';
import 'package:health_direct/products/Vitamins.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      
     // initialRoute: HomeLayout.ScreenRoute,
     //initialRoute: HomeLayout.ScreenRoute,
    initialRoute: start_screen.ScreenRoute,
      routes: {
       // WelcomeScreen.ScreenRoute:(context) => WelcomeScreen(),
      login_screen.ScreenRoute:(context) => login_screen(),
      register_screen.ScreenRoute:(context) => register_screen(),
       reset_screen.ScreenRoute:(context) => reset_screen(),
        start_screen.ScreenRoute:(context) => start_screen(),
        add_item_screen.ScreenRoute:(context) => add_item_screen(),
        modify_item_screen.ScreenRoute:(context) => modify_item_screen(),
        categories_screen.ScreenRoute:(context) => categories_screen(),
        HomeLayout.ScreenRoute:(context) => HomeLayout(),
        beauty_care.ScreenRoute:(context) => beauty_care(),
        health.ScreenRoute:(context) => health(),
        medicines.ScreenRoute:(context) => medicines(),
mumandbaby.ScreenRoute:(context) => mumandbaby(),
personalcare.ScreenRoute:(context) => personalcare(),
vitamins.ScreenRoute:(context) => vitamins(),
AdmainScreen.ScreenRoute:(context) => AdmainScreen(),
      
        
        
      }
    );
  }
}

