
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shop/model/cart_model.dart';
import 'package:provider/provider.dart';

import '../api_functions/api_function.dart';
import '../constand.dart';
import '../screens/cart_page.dart';
import '../widgets/bottom.dart';
import '../widgets/category_card.dart';
import '../widgets/grocery card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts().then((data) {
      setState(() {
        products = data;
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: CustomScrollView(
        slivers:<Widget> [
          SliverAppBar(
            backgroundColor: white,
            title: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: 'GRO',
                  style: TextStyle(
                      color: orange,
                      fontFamily: 'poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: 'CERY',
                      style: TextStyle(
                          color: blue,
                          fontFamily: 'poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            floating: true,
            leading: Icon(
              color: blue,
              (Icons.shopping_cart_outlined),
            ),
            actions: [
              CircleAvatar(
                backgroundColor: CupertinoColors.white,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_active_outlined,
                      color: blue,
                    )),
              ),
            ],
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            elevation: 16,
          ),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: blue,
                      size: 23,
                    ),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider(
                items: products.map((product) {
                  final image = product['image'];
                  return Image.network(
                    image,
                    fit: BoxFit.cover,
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: 1,
                  aspectRatio: 10 / 5,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
            ),
                Container(
                    height: 100,
                    width: double.infinity,
                    child: CategoryCard()),

          ])),
          SliverList(delegate: SliverChildListDelegate([
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                height: MediaQuery.of(context).size.height*1,
                child: Consumer<CartModel>(builder: (context,value, child){
                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.shopItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.2,
                    ),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () =>
                            Provider.of<CartModel>(context, listen: false)
                                .addItemToCart(index),
                      );
                    },
                  );
                },
                ),
              ),
        ]
            ),
            CartPage()
          ]))
        ],
      )),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag),
      ),
    );
  }
}
