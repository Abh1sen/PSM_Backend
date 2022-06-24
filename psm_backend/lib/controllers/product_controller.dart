import 'package:get/get.dart';
import 'package:psm_backend/models/models.dart';

class ProductController extends GetxController {
  List<Product> products = Product.products.obs;

  void updateProductPrice(
    int index,
    Product product,
    double value,
  ) {
    product.price = value.toInt();
    products[index] = product;
  }

  void updateProductQuantity(
    int index,
    Product product,
    double value,
  ) {
    product.quantity = value.toInt();
    products[index] = product;
  }
}
