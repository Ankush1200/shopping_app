import 'package:flutter/material.dart';
import 'package:shoping_app/cart_page.dart';

import 'package:shoping_app/product_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentpage=0;
  List<Widget>pages=const [
    ProductList(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      IndexedStack(
        index: currentpage,
        children:pages,
      ),
      bottomNavigationBar: SizedBox(
        height :80,
        child: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 30,
          onTap: (value) {
            setState(() {
              currentpage=value;
            });
          },
          backgroundColor: const Color.fromARGB(255, 190, 190, 190),
          currentIndex: currentpage,
          items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          )
        ],),
      ),
    );
  }
}
