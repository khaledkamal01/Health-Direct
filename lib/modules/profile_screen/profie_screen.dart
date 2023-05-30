import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:health_direct/modules/start_screen/start_screen.dart';

import 'package:health_direct/utils/utils.dart';
class profileScreen extends StatefulWidget {

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
   User? user =FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users/").where('id',isEqualTo: user!.uid,).snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data!.docs;
           return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisExtent: 1000),
          
          itemCount: 1,
          itemBuilder: (ctx,index) => 
           

              
               Column(
                children: [
                //if (docs[index]['id']==user!.uid.toString())
                Icon(Icons.account_circle,size: 200,),
                Text((docs[index]['FirstName']+" "+docs[index]['LastName']),textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),),
                SizedBox(height: 40,),
                Text(docs[index]['Email'],textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                SizedBox(height: 250,),
               Container(child: IconButton(onPressed: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, start_screen.ScreenRoute);
               }
               , icon: Icon(Icons.logout_outlined),iconSize: 30,color: Color(0xFF516091),),margin: EdgeInsets.only(left: 300),),
                ])
                );
                })
            
                
                );

  }
  }
