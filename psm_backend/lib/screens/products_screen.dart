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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}