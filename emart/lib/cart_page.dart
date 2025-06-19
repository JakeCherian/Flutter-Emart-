import 'package:flutter/material.dart';
import"package:emart/global_variables.dart";
class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

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
        )
      ),
      body:ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index){
          final cartItem = cart[index];
          return Column(
            children: [
              SizedBox(height: 20),
              Text("Your Cart", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 40),
              ListTile(
                leading: Image.asset(cartItem['ImageURL'].toString()),
                title:Text(
                  cartItem['title'].toString(),style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                subtitle: Text("Size: ${cartItem['Size']}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                trailing: IconButton(onPressed: (){}, icon:Icon(Icons.delete)),
              ),
            ],
          );

        })
    );
  }
}
