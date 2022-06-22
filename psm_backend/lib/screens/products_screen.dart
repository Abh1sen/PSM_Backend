import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/models/models.dart';
import '/screens/screens.dart';
import '/controllers/controllers.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: Product.products.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 120,
                      child: ProductCard(product: Product.products[index]),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            product.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
