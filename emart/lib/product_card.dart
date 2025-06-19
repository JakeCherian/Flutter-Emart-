import 'package:emart/global_variables.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final int index;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(210, 183, 182, 182),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(price, style: TextStyle(fontSize: 15)),
          ),
          Hero(
            tag: products[index]['id'].toString(),
            child: Center(
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(image),
                // height:340,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
