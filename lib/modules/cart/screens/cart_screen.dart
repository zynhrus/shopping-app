import 'package:fit_hub_project/main.import.dart';
import 'package:fit_hub_project/main.library.dart';
import 'package:fit_hub_project/modules/cart/controllers/controllers.dart';
import 'package:fit_hub_project/modules/home/home.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildProductsList(),
        _buildBottomBar(),
      ],
    );
  }

  Widget _buildProductsList() {
    return SingleChildScrollView(
      child: GetX<CartController>(
        init: CartController(),
        builder: (controller) {
          final products = controller.products;
          if (products.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Belum ada barang yang kamu masukan ke dalam cart, silahkan tambahkan terlebih dahulu",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 110),
              child: Column(
                children: products.toSet().map((e) {
                  return ProductTile(
                    productData: e,
                    total: products.where((product) => product == e).length,
                    isBuy: true,
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 8),
          width: double.infinity,
          height: 110,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GetX<CartController>(
                init: CartController(),
                builder: (controller) {
                  final prices = controller.products
                      .map((element) => element.price)
                      .toList();
                  final total = prices.fold(0, (p, c) => p + c);

                  return Text(
                    "Total : \$$total",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: const Center(
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: false,
      leadingWidth: 0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: const Text(
        "Your Cart",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
