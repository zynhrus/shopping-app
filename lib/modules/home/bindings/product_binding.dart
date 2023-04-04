import 'package:dio/dio.dart';
import 'package:fit_hub_project/config/rest_api/rest_api_services.dart';
import 'package:fit_hub_project/main.library.dart';
import 'package:fit_hub_project/modules/home/controllers/product_controller.dart';
import 'package:fit_hub_project/modules/home/providers/product_provider.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.lazyPut(() => RestApiService(dio: Get.find()));
    Get.lazyPut(() => ProductProvider(restApiService: Get.find()));
    Get.lazyPut(() => ProductController(productProvider: Get.find()));
  }
}
