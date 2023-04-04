import 'package:fit_hub_project/main.library.dart';
import 'package:fit_hub_project/modules/home/home.dart';

class CartController extends GetxController {
  var products = <ProductModel>[].obs;

  void addCart(ProductModel product) {
    products.add(product);
  }

  void minCart(ProductModel product) {
    var index = products.indexOf(product);
    products.removeAt(index);
  }

  void deleteCart(ProductModel product) {
    products.removeWhere((item) => item == product);
  }
}
