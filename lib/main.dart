import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shop/Homepage/homepage.dart';
import 'package:grocery_shop/model/cart_model.dart';
import 'package:grocery_shop/screens/splashscreen.dart';
import 'package:provider/provider.dart';


void main()=>runApp(GroceryApp());

class GroceryApp extends StatelessWidget {
  const GroceryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
          home: Homepage(),
          title: "SLR SHOPPEE",
          debugShowCheckedModeBanner: false,
        ),
    );
  }
}
