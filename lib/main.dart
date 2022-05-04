import 'package:bloc_sample/screens/cart_screen.dart';
import 'package:bloc_sample/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BlocSampleApp());
}

class BlocSampleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        "/": (BuildContext context) => ProductListScreen(),
        "/cart":(BuildContext context) => CartScreen()
      },
      initialRoute: "/"

    );
  }


}