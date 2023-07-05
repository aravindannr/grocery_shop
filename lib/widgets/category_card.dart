
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constand.dart';

class CategoryCard extends StatefulWidget {

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  final List<IconData> icns = [
    Icons.shopping_basket,
    Icons.local_dining,
    Icons.restaurant,
    Icons.local_cafe,
    Icons.fastfood
  ];

  List<String> name = [
    'Fruits and Vegetables',
  'Dairy Products',
  'Meat and Seafood',
    'Bakery and Bread',
    'Snacks and Sweets',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: icns.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height * .10,
            width: MediaQuery.of(context).size.width * .20,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: red,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icns[index],
                  size: 10,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  name[index],
                  style: TextStyle(
                    color: white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
