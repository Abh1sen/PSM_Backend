import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:psm_backend/controllers/controllers.dart';

class NewProductScreen extends StatelessWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Product',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.black,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => const NewProductScreen());
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Add an Image',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Product Information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildTextFormField('Product ID'),
            _buildTextFormField('Product Name'),
            _buildTextFormField('Product Description'),
            _buildTextFormField('Product Category'),
            const SizedBox(
              height: 20,
            ),
            _buildSlider('Price'),
            _buildSlider('Quantity'),
            const SizedBox(
              height: 20,
            ),
            _buildCheckBox('Recommended'),
            _buildCheckBox('Popular'),
          ],
        ),
      ),
    );
  }

  Row _buildCheckBox(String title) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Checkbox(
            value: true,
            checkColor: Colors.black,
            activeColor: Colors.black12,
            onChanged: (value) {}),
      ],
    );
  }

  Row _buildSlider(String title) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Slider(
            value: 0,
            min: 0,
            max: 200000,
            divisions: 20,
            activeColor: Colors.black,
            inactiveColor: Colors.black12,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(String hintText) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
