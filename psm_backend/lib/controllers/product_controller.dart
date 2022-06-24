import 'package:get/get.dart';
import 'package:psm_backend/models/models.dart';
import 'package:psm_backend/services/database_service.dart';

class ProductController extends GetxController {
  final DatabaseService database = DatabaseService();
  var products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(database.getProducts());
    super.onInit();
  }

  var newProduct = {}.obs;

  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];

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
