import 'package:bloc_sample/models/product.dart';

class ProductService{

  static List<Product> products = <Product>[];

  static final ProductService _singleton = ProductService._internal();

  factory ProductService(){

    return _singleton;
  }


  ProductService._internal();

  static List<Product> getAll(){

    products.add(Product(1,"Macbook Pro", 35000));
    products.add(Product(2,"Macbook Air", 10000));
    products.add(Product(3,"MSİ", 15000));
    products.add(Product(4,"MONSTER", 2000));
    products.add(Product(5,"Lenovo Thinkpad", 34000));

    return products;

  }



}