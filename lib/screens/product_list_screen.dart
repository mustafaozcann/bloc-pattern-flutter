import 'package:bloc_sample/blocs/cart_bloc.dart';
import 'package:bloc_sample/blocs/product_bloc.dart';
import 'package:bloc_sample/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş"),
        actions: <Widget>[
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: const Icon(Icons.add_shopping_cart))
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
      initialData: productBloc.getAll(),
      stream: productBloc.getStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.data.length > 0
            ? buildProductListItem(snapshot)
            : const Center(
                child: Text("Data yok"),
              );
      },
    );
  }

  buildProductListItem(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int position) {
          final list = snapshot.data;
          return ListTile(
            title: Text(list[position].name),
            subtitle: Text(list[position].price.toString()),
            trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: (){
                cartBloc.addToCart(Cart(list[position], 1));
              },
            ),
          );
        });
  }
}
