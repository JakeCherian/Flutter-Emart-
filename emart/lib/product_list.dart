import "package:flutter/material.dart";
import 'package:emart/global_variables.dart';
import 'package:emart/product_card.dart';
import 'package:emart/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Nike',
    'Adidas',
    'Puma',
    'Kipsta',
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  "The Boot\nStore",
                  style: TextStyle(fontSize: 30, fontFamily: "Orbitron"),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Find Your Boots",
                      hintStyle: TextStyle(fontSize: 13),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (context, index) {
              final filter = filters[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedFilter = filter;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Chip(
                    side: BorderSide(
                      color: const Color.fromARGB(31, 0, 0, 0),
                    ),
                    backgroundColor: selectedFilter == filter
                        ? const Color.fromARGB(206, 0, 0, 0)
                        : const Color.fromARGB(219, 176, 176, 183),
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selectedFilter == filter
                          ? Colors.white
                          : Colors.black,
                    ),
                    label: Text(filter),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetalsPage(product: product),
                    ),
                  );
                },
                child: ProductCard(
                  title: product["title"] as String,
                  price: product["price"] as String,
                  image: product["ImageURL"] as String,
                  index: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
