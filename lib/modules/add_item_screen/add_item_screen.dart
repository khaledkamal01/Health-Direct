



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:health_direct/utils/utils.dart';

class add_item_screen extends StatefulWidget {
  static const String ScreenRoute = 'add_item_screen';


  const add_item_screen({super.key});
   
  @override
  State<add_item_screen> createState() => _add_item_screenState();
}
class _add_item_screenState extends State<add_item_screen> {
  final DatabaseReference = FirebaseDatabase.instance.ref("Categories");
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final dascriptionController = TextEditingController();
    var  selectedCategory  ;
    final db =FirebaseFirestore.instance;
    final imagecontroller = TextEditingController();
    var price;
    //////////////////////////////////////
    ///
 
  @override
  Widget build(BuildContext context) {
       uploadData(String name,double pricee,String description,String image)async{
        name;
      List<String> splitList = name.split(' ');
      List<String> indexList = [];
      for(int i=0;i<splitList.length ;i++){

        for(int j =0;j<splitList[i].length +1;j++){
          indexList.add(splitList[i].substring(0,j).toLowerCase());
          indexList.add(splitList[i].substring(0,j));
          indexList.add(splitList[i].substring(0,j).toUpperCase());
          indexList.add(name);
          indexList.add(name.toLowerCase());
          indexList.add(name.toUpperCase());
        }
      }
      db.collection('Products').add(
        {
'Name' : name,
"Description" : description,
"Price": pricee,
'Image':image,
'searchindex':indexList,
        }
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF516091),
        title: Text(
          "Add item",
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
          child: SingleChildScrollView(
            child: Column(
              children: [
              
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
                  SizedBox(height: 20,),
                TextFormField(
                  
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(60.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFF516091),
                      ),
                    ),
                  ),
                 
                ),
                SizedBox(height: 20,),
                TextFormField(
                 // controller: priceController,
                  onChanged: (value) {
                    setState(() {
                      price = double.parse(value);
                    });
                  },
                  
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(60.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFF516091),
                      ),
                    ),
                  ),
                 
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: dascriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(

                    labelText: 'description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.zero,
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFF516091),
                      ),
                    ),
                  ),
                 
                ),
                SizedBox(height: 20,),
                TextFormField(
                  toolbarOptions: ToolbarOptions(paste: true,copy: true,selectAll: true,cut: true),
                  controller: imagecontroller,
                  maxLines: 2,
                  decoration: InputDecoration(
                      
                    labelText: 'image',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.zero,
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFF516091),
                      ),
                    ),
                  ),
                
                ),
                SizedBox(height: 10,),
                MaterialButton(
                  child: Text("Add" ,style: TextStyle(fontSize: 20),),
                  height: 30,
                  minWidth: 60,
                  color: Color(0xFF516091),
                  onPressed: () async{
                    uploadData(nameController.text,price,dascriptionController.text,imagecontroller.text);
                   FirebaseFirestore.instance.collection("Medicines/"+ selectedCategory + "/"+selectedCategory).
                 add({
                  
                  "Name" : nameController.text,
                  "Description" : dascriptionController.text,
                  "Price": price,
                  'Image':imagecontroller.text,
                 })
                  .then((value){
                    Utils().toastMessage("Medicine added");
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
                })

              ],
            ),
          ),
        ),
      ),
    );
  }
}

  