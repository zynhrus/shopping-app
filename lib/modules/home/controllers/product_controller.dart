import 'package:fit_hub_project/main.library.dart';
import 'package:fit_hub_project/modules/home/home.dart';

class ProductController extends GetxController
    with StateMixin<List<ProductModel>> {
  final ProductProvider productProvider;

  ProductController({required this.productProvider});

  @override
  void onInit() {
    super.onInit();
    fetchAllProduct();
  }

  void fetchAllProduct() {
    change(null, status: RxStatus.loading());
    productProvider.getProducts().then((result) {
      List<ProductModel> products = result;
      change(products, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void filterProduct({required ProductFilter filterType}) {
    change(null, status: RxStatus.loading());
    productProvider.getProducts().then((result) {
      List<ProductModel> filteredProduct = result;
      if (filterType == ProductFilter.lowestPrice) {
        filteredProduct.sort((a, b) => a.price.compareTo(b.price));
      } else if (filterType == ProductFilter.highestPrice) {
        filteredProduct.sort((a, b) => b.price.compareTo(a.price));
      } else if (filterType == ProductFilter.byNameAtoZ) {
        filteredProduct.sort(
            (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
      } else {
        filteredProduct.sort(
            (a, b) => b.title.toLowerCase().compareTo(a.title.toLowerCase()));
      }

      change(filteredProduct, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
