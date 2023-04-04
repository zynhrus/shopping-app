import 'package:fit_hub_project/modules/cart/cart.dart';
import 'package:fit_hub_project/modules/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CartController _productController;
  final testProduct = ProductModel(
    title: "Test",
    id: 1,
    brand: "Test",
    category: "Test",
    description: "Test",
    discountPercentage: 1,
    images: ["Test"],
    price: 1,
    rating: 1,
    stock: 1,
    thumbnail: "Test",
  );

  setUp(() {
    _productController = CartController();
  });

  group("Cart Controller", () {
    test("Initialize Cart", () {
      expect(_productController.products.length, 0);
    });

    test("Add Cart", () {
      _productController.addCart(testProduct);
      expect(_productController.products.length, 1);
      expect(_productController.products.first, testProduct);
    });

    test("Min Cart", () {
      _productController.addCart(testProduct);
      _productController.addCart(testProduct);
      _productController.addCart(testProduct);
      _productController.addCart(testProduct);
      _productController.minCart(testProduct);
      expect(_productController.products.length, 3);
    });

    test("Delete Cart", () {
      _productController.addCart(testProduct);
      _productController.addCart(testProduct);
      _productController.addCart(testProduct);
      _productController.addCart(testProduct);
      _productController.deleteCart(testProduct);
      expect(_productController.products.length, 0);
    });
  });
}
