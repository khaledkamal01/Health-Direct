import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class delete_item_screen extends StatefulWidget {
  const delete_item_screen({super.key});

  @override
  State<delete_item_screen> createState() => _delete_item_screenState();
}

class _delete_item_screenState extends State<delete_item_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextFormField(decoration:InputDecoration(prefixIcon: Icon(Icons.search,color: Color(0xFF516091),),border: OutlineInputBorder(
                       
                        borderSide: BorderSide(
                          color: Color(0xFF516091),
                        ),
                      ), ),),
        backgroundColor: Color(0xFF516091),
        title: Text(
          "Delete item",
          style: TextStyle(
            fontSize: 35.0,
            fontFamily:'Segoeuib',
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}