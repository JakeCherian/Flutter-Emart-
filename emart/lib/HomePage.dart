import 'package:emart/cart_page.dart';
import 'package:emart/product_list.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  
  List<Widget> pages =const [ProductList(), Cartpage()];

  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage == 0 ? pages[0] : pages[1],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: currentPage,
      onTap: (index) {
        setState(() {
          currentPage = index;
        });
      },
      iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
      )
    );
  }
}
