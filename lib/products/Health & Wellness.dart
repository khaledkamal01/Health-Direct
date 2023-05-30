import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'package:health_direct/utils/utils.dart';
class health extends StatefulWidget {
  static const String ScreenRoute = 'health';
  const health({super.key});

  @override
  State<health> createState() => _healthState();
}

class _healthState extends State<health> {
  User? user =FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Medicines/Health & Wellness/Health & Wellness").snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data!.docs;
           return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 300),
          
          itemCount: docs.length,
          itemBuilder: (ctx,index) => Container(
            padding: EdgeInsets.all(8),
            child:  Container(
              decoration: BoxDecoration(
                
                color: Color(0xFF516091),
              border: Border.all(color: Color(0xFF516091))
             ),
            //margin: EdgeInsets.only(top: 50,left: 140,right: 90),

              
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Image.network(docs[index]['Image'],height: 110,alignment:Alignment.topCenter),
                  SizedBox(height: 4,),
                Text(docs[index]['Name']),
              //  Text(docs[index]['Description'],style: TextStyle(fontSize: 10),),
                Text(docs[index]['Price'].toString()+" JD"),
                MaterialButton(onPressed:(){
                showDialog(context: context, builder: (BuildContext context){
                  return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('test message!'),
                SizedBox(height: 5.0,),
                Text(docs[index]['Description']),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                }, 
                child: Text('OK!'),
                ),
              ],
            ),
          ),
          Positioned(child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 60.0,
            child: Icon(Icons.description,size: 60,color: Colors.white,),
          ),
          top: -60,
          )
        ],
      ),
    );
                });
              },child: Text("Description" ,style: TextStyle(color: Colors.white),),),

                MaterialButton(onPressed: (){
                  FirebaseFirestore.instance.collection("Users").doc(user!.uid).collection("Cart").
                 add({
                  "Image" :docs[index]['Image'].toString(),
                  "Name" : docs[index]['Name'].toString(),
                  "Description" : docs[index]['Description'].toString(),
                  "Price": docs[index]['Price'].toString(),
                 })
                  .then((value){
                    Utils().toastMessage("added to cart");
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
                },height: 10,child: Text("add to cart"))
              ],),
            )
          )
        
          );
          },
      ),
    );
}
}