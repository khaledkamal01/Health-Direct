import 'package:flutter/material.dart';
//button
Widget defaultButton({
  double width = double.infinity,
  double? height,
  double fontSize=30.0,
  String fontFamily='segoeuib',
  Color background = Colors.blue,
  bool isUpperCase=true,
  double radius=0.0,
  required String text,
  required VoidCallback function,
})=> Container(

  width: width,
  height: height,

  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCase?text.toUpperCase():text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: Colors.white,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
);

//form field
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  required FormFieldValidator validate,
  required String label,
  required Widget prefix,
  IconData? suffix,
  bool isPassword=false,
  VoidCallback? suffixPressed,
  GestureTapCallback? onTap,
  bool isClickable=true,
})=>TextFormField(
  obscureText:isPassword,
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: onSubmit,
  enabled: isClickable,
  onTap: onTap,
  validator: validate,
  decoration: InputDecoration(
    //hintText: 'Email',
    labelText: label,
    prefixIcon: prefix,
    suffixIcon: suffix!=null?IconButton(
        onPressed: suffixPressed,
        icon: Icon(suffix)):null,
    border: OutlineInputBorder(),
  ),
);

