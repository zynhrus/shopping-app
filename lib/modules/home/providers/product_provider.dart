import 'package:fit_hub_project/config/rest_api/rest_api_services.dart';
import 'package:fit_hub_project/constant/constant.dart';
import 'package:fit_hub_project/modules/home/models/models.dart';

class ProductProvider {
  final RestApiService restApiService;

  const ProductProvider({required this.restApiService});

  Future<List<ProductModel>> getProducts() async {
    final res = await restApiService.get(ApiPath.products);

    final products = (res.data['products'] as List<dynamic>)
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return products;
  }
}
