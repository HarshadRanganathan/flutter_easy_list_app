import 'dart:developer';

import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () async {
                  bool value = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(
                          title: products[index]['title'],
                          imageUrl: products[index]['image']),
                    ),
                  );
                  if(value) deleteProduct(index);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProductItem,
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
