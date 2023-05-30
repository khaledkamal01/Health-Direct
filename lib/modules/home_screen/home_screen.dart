

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:health_direct/utils/utils.dart';

class homeScreen extends StatefulWidget {

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
    User? user =FirebaseAuth.instance.currentUser;
  String name="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Card(child: TextFormField(decoration:InputDecoration(prefixIcon: Icon(Icons.search,color: Color(0xFF516091),),border: OutlineInputBorder(
                       
                        borderSide: BorderSide(
                          color: Color(0xFF516091),
                        ),
                      ), ),
                      onChanged: (value) {
                        setState(() {
                          name=value;
                        });
                      },
                      )
                      ),),
        body:
         
          
          

                      StreamBuilder<QuerySnapshot>(
        stream: (name !="" && name!=null)?FirebaseFirestore.instance.collection("Products").where('searchindex',arrayContains: name ).snapshots() :
        FirebaseFirestore.instance.collection("Products").snapshots(),
        builder: (ctx, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)?Center(child: CircularProgressIndicator()):
          //final docs = snapshot.data!.docs;
           /*return*/ 
           ListView.builder(
            
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (ctx,index) { 
          DocumentSnapshot data =snapshot.data!.docs[index];
            return Container(
            padding: EdgeInsets.only(top: 16),
            child:   Column(
                children: [
                  ListTile(
                    title: Text(data['Name'],style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,
                  ),
                  leading:CircleAvatar(child: Image.network(data['Image'],width: 100,height: 50,fit: BoxFit.contain,)) ,
                  trailing:IconButton(onPressed: (){
                    FirebaseFirestore.instance.collection("Users").doc(user!.uid).collection("Cart").
                 add({
                  "Image" :data['Image'].toString(),
                  "Name" : data['Name'].toString(),
                  "Description" : data['Description'].toString(),
                  "Price": data['Price'].toString(),
                 })
                  .then((value){
                    Utils().toastMessage("added to cart");
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
                  },icon: Icon(Icons.add_shopping_cart_sharp,size: 30,),)
                  ),
                  Divider(thickness: 2,)
                 ])
                 );}
                 );
                 }
                 )
                 
                 );
                 }}