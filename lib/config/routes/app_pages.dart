import 'package:fit_hub_project/config/routes/route_names.dart';
import 'package:fit_hub_project/main.library.dart';
import 'package:fit_hub_project/modules/cart/cart.dart';
import 'package:fit_hub_project/modules/home/home.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteName.home, page: () => const HomeScreen()),
    GetPage(name: RouteName.cart, page: () => const CartScreen())
  ];
}
