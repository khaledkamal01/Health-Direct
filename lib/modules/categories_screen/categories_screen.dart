import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_direct/products/Beauty_care.dart';
import 'package:health_direct/products/Health%20&%20Wellness.dart';
import 'package:health_direct/products/Medicines%20&%20Treatments.dart';
import 'package:health_direct/products/Mum%20And%20Baby.dart';
import 'package:health_direct/products/Personal%20Care.dart';
import 'package:health_direct/products/Vitamins.dart';

class categories_screen extends StatefulWidget {
  static const String ScreenRoute = 'categories_screen';
  const categories_screen({super.key});

  @override
  State<categories_screen> createState() => _categories_screenState();
}

class _categories_screenState extends State<categories_screen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:
          [
            InkWell(
              onTap: (){
                 Navigator.pushNamed(context, beauty_care.ScreenRoute);
              },
              child: Image.network(
                  'https://www.al-dawaa.com/media/wysiwyg/home/categories/beauty_care-en.png'
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            InkWell(
                onTap: (){
                 Navigator.pushNamed(context, personalcare.ScreenRoute);
                },
                child: Image.network(
                    'https://www.al-dawaa.com/media/wysiwyg/home/categories/personal_care-en.png'
                )
            ),
            SizedBox(
              height: 15.0,
            ),
            InkWell(
                onTap: (){
                     Navigator.pushNamed(context, health.ScreenRoute);
                },
                child: Image.network(
                    'https://www.al-dawaa.com/media/wysiwyg/home/categories/health_and_wellness-en.png'
                )
            ),
            SizedBox(
              height: 15.0,
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, medicines.ScreenRoute);
              },
              child: Image.network(
                  'https://www.al-dawaa.com/media/wysiwyg/home/categories/medicine_and_treatments-en.png'
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, mumandbaby.ScreenRoute);
              },
              child: Image.network(
                  'https://www.al-dawaa.com/media/wysiwyg/home/categories/mum_and_baby-en.png'
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, vitamins.ScreenRoute);
              },
              child: Image.network(
                  'https://www.al-dawaa.com/media/wysiwyg/home/categories/vitamins_and_healthy_nutrition-en.png'
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  