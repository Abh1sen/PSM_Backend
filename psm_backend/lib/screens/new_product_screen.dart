import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:psm_backend/controllers/controllers.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({Key? key}) : super(key: key);

  final ProductController productController = Get.find();

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
        child: Obx(
          () => Column(
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
                        onPressed: () async {
                          ImagePicker _picker = ImagePicker();
                          final XFile? _image = await _picker.pickImage(
                              source: ImageSource.gallery);

                          if (_image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('No Image was Selected.')));
                          }

                          if (_image != null) {}
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
              _buildSlider(
                'Price',
                'price',
                productController,
                productController.price,
              ),
              _buildSlider(
                'Quantity',
                'quantity',
                productController,
                productController.quantity,
              ),
              const SizedBox(
                height: 20,
              ),
              _buildCheckBox(
                'Recommended',
                'isRecommended',
                productController,
                productController.isRecommended,
              ),
              _buildCheckBox(
                'Popular',
                'isPopular',
                productController,
                productController.isPopular,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      print('Save');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: const Text(
                      'Save',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _buildCheckBox(
    String title,
    String name,
    ProductController productController,
    bool? controllerValue,
  ) {
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
          value: (controllerValue == null) ? false : controllerValue,
          checkColor: Colors.black,
          activeColor: Colors.black12,
          onChanged: (value) {
            productController.newProduct.update(
              name,
              (_) => value,
              ifAbsent: () => value,
            );
          },
        ),
      ],
    );
  }

  Row _buildSlider(
    String title,
    String name,
    ProductController productController,
    double? controllerValue,
  ) {
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
            value: (controllerValue == null) ? 0 : controllerValue,
            min: 0,
            max: 200000,
            divisions: 20,
            activeColor: Colors.black,
            inactiveColor: Colors.black12,
            onChanged: (value) {
              productController.newProduct.update(
                name,
                (_) => value,
                ifAbsent: () => value,
              );
            },
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
