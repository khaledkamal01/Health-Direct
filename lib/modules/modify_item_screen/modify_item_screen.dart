import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import'package:flutter/material.dart';
class modify_item_screen extends StatefulWidget {
  static const String ScreenRoute = 'modify_item_screen';
  const modify_item_screen({super.key});
  

  @override
  State<modify_item_screen> createState() => _modify_item_screenState();
}

class _modify_item_screenState extends State<modify_item_screen> {
  final auth = FirebaseAuth.instance;
  var selectedCategory;
  var news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF516091),
        title: Text(
          "Edit item",
          style: TextStyle(
            fontSize: 35.0,
            fontFamily:'Segoeuib',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        DropdownButton(

                hint: Text("Choose the category"),
                items: [
                "Mum And Baby",
              "Personal Care",
              "Beauty Care",
              "Health & Wellness",
              "Medicines & Treatments",
              "vitamins & Healthy Nutrition",]
              .map((e) => DropdownMenuItem(child: Text("$e"),value: e,))
              .toList(),
               onChanged: (val){
               setState(() {
                 selectedCategory=val;
                 
               });
               },
               value: selectedCategory,
               ),
               
              
        Expanded(
        
          child: FirebaseAnimatedList(
            query:   FirebaseDatabase.instance.ref("Categories").child("$e"),
            
             itemBuilder:  (BuildContext context, DataSnapshot snapshot,Animation<double> animation, int index){
              return  ListTile(
              title: Text(snapshot.child('name').value.toString()),
              subtitle: Text(snapshot.child('id').value.toString()),
             );
             }
              ),
        ),
        
      ],)

    );
  }
}
