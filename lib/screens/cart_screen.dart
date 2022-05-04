import 'package:bloc_sample/blocs/cart_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş Sepeti"),
      ),
      body: StreamBuilder(
        stream: cartBloc.getStream,
        initialData: cartBloc.getCart(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return buildCart(snapshot);
        },
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, position) {
          final cart = snapshot.data;
          return ListTile(
            title: Text(cart[position].product.name),
            subtitle: Text(cart[position].product.price.toString()),
            trailing: IconButton(
              icon: const Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cartBloc.removeFromCart(cart[position]);
              },
            ),
          );
        });
  }
}
