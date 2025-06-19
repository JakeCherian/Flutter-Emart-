import 'package:flutter/material.dart';

class ProductDetalsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetalsPage({super.key, required this.product});

  @override
  State<ProductDetalsPage> createState() => _ProductDetalsPageState();
}

class _ProductDetalsPageState extends State<ProductDetalsPage> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(210, 183, 182, 182),
        title: Center(
          child: Text(
            "The Boot Store, Kochi, India",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Center(
            child: Text(
              widget.product['title'].toString(),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Hero(
            tag: widget.product['id'].toString(),
            child: Center(
              child: Image(
                image: AssetImage(widget.product['ImageURL'].toString()),
                height: 300,
              ),
            ),
          ),
          const Spacer(flex: 2),
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(210, 224, 223, 223),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Price ${widget.product['price'].toString()}",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Product of:  ${widget.product['company'].toString()}",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 40),
                Text(
                  "Select Your Size",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['Size'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size = (widget.product['Size'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            side: BorderSide(color: Colors.black),
                            backgroundColor: selectedSize == size
                                ? Color.fromARGB(188, 0, 0, 0)
                                : null,
                            labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: selectedSize == size
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            label: Text(size.toString()),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Add to Cart", style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
