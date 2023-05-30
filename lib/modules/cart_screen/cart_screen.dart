
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_direct/utils/utils.dart';


class cartScreen extends StatefulWidget {

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
   var totalprice;
 final currentUser = FirebaseAuth.instance;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        
        stream: FirebaseFirestore.instance.collection("Users/"+currentUser.currentUser!.uid.toString()+"/Cart").snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data!.docs;
          
           return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 310),
          
          itemCount: docs.length,
          itemBuilder: (ctx,index) => 
           Container(
            padding: EdgeInsets.all(10),
            child:  Container(
              decoration: BoxDecoration(
                
                color: Color(0xFF516091),
              border: Border.all(color: Color(0xFF516091))
             ),
            //margin: EdgeInsets.only(top: 50,left: 140,right: 90),

              
              child: Stack(
                children: [ Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){
                          FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("Cart").doc(docs[index].id).delete();
                        }, icon: Icon(Icons.cancel),color: Colors.red,),
                      ],
                    ),
                    Image.network(docs[index]['Image'],height:110,alignment:Alignment.topCenter),
                    SizedBox(height: 15,),
                  Text(docs[index]['Name'],style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,),
                 SizedBox(height: 15,),
                  Text(docs[index]['Price']+ " JD" ,style: TextStyle(fontSize: 14,)),
                  
                  
                ],),
               
                
                ]
                
              ),
              
            ),
          ),
        
          );
          },
          
      ),
      
    );
  }
}
  
