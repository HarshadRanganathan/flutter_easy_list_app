import 'package:flutter/material.dart';
import './product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductList() {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                ProductCard(products[index], index),
            itemCount: products.length,
          )
        : Center(
            child: Text('No products found, please add some'),
          );
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
