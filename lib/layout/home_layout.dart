import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_direct/modules/add_item_screen/add_item_screen.dart';
import 'package:health_direct/modules/cart_screen/cart_screen.dart';
import 'package:health_direct/modules/categories_screen/categories_screen.dart';
import 'package:health_direct/modules/home_screen/home_screen.dart';
import 'package:health_direct/modules/profile_screen/profie_screen.dart';

import 'package:health_direct/modules/delete_item_screen/delete_item_screen.dart';
import 'package:health_direct/modules/modify_item_screen/modify_item_screen.dart';
import 'package:health_direct/search_screen/search_screen.dart';

class HomeLayout extends StatefulWidget {
 static const String ScreenRoute = 'home_layout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex=0;
  List<Widget> screens=[
    homeScreen(),
    categories_screen(),
     search_screen(),
    cartScreen(),
    profileScreen(),
  ];
  List<String> titles=
  [
    'Home',
    'Categories',
    'Search',
    'Cart',
    'Profile',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF516091),
        title: Text(
          titles[currentIndex],
          style: TextStyle(
            fontSize: 35.0,
            fontFamily:'Segoeuib',
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 40,),
              ListTile(
                title: Text('Add'),leading: Icon(Icons.add),onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context){
                    return add_item_screen();
                  }));

              },
              ),
              ListTile(
                title: Text('Delete'),leading: Icon(Icons.delete),onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context){
                  return delete_item_screen();
                }));

              },
              ),
              ListTile(
                title: Text('Edit'),leading: Icon(Icons.edit),onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context){
                  return modify_item_screen();
                }));

              },
              ),


            ],
          ),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 50.0,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        items:
        [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Categories',
          ),
             BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            
          ),
        ],
      ),
    );
  }
}
