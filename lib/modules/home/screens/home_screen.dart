import 'package:fit_hub_project/main.import.dart';
import 'package:fit_hub_project/main.library.dart';
import 'package:fit_hub_project/modules/cart/cart.dart';
import 'package:fit_hub_project/modules/home/controllers/product_controller.dart';
import 'package:fit_hub_project/modules/home/models/models.dart';
import 'components/components.dart';

class HomeScreen extends GetView<ProductController> {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: controller.obx(
        (data) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: data!.map((e) {
              return ProductTile(productData: e);
            }).toList(),
          ),
        ),
        onEmpty: _buildEmpty(context),
        onLoading: _buildLoading(),
        onError: (error) => _buildError(error),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: const Text(
        "List Product",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        InkWell(
          onTap: () async {
            ProductFilter selectedFilter = await Get.defaultDialog(
              title: "Pilih Filter",
              content: _buildDialogContent(),
            );

            controller.filterProduct(filterType: selectedFilter);
          },
          child: const Icon(Icons.filter_list_alt, color: Colors.grey),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () => Get.toNamed(RouteName.cart),
          child: const Icon(Icons.shopping_cart, color: Colors.grey),
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  Widget _buildDialogContent() {
    return Column(
      children: [
        _dialogButton(
          text: "Termurah",
          filter: ProductFilter.lowestPrice,
        ),
        _dialogButton(
          text: "Termahal",
          filter: ProductFilter.highestPrice,
        ),
        _dialogButton(
          text: "Alphabet A - Z",
          filter: ProductFilter.byNameAtoZ,
        ),
        _dialogButton(
          text: "Alphabet Z - A",
          filter: ProductFilter.byNameZtoA,
        ),
      ],
    );
  }

  Widget _dialogButton({required String text, required ProductFilter filter}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => Get.back(result: filter),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: List.generate(8, (index) => ProductTile.loader()),
      ),
    );
  }

  Widget _buildError(String? error) {
    return Center(
      child: Text("Error : $error"),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Text(
        "Produk Kosong",
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
