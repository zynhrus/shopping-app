import 'package:fit_hub_project/main.import.dart';
import 'package:fit_hub_project/main.library.dart';
import 'package:fit_hub_project/modules/cart/controllers/controllers.dart';
import 'package:fit_hub_project/modules/home/home.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productData;
  final int total;
  final bool isBuy;

  const ProductTile({
    Key? key,
    required this.productData,
    this.total = 0,
    this.isBuy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImagePlaceholder(
              height: 90,
              width: 90,
              borderRadius: BorderRadius.circular(8),
              imageUrl: productData.thumbnail,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productData.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(productData.description),
                      const SizedBox(height: 3),
                      Text(
                        "\$${productData.price}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (isBuy)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _tileButton(
                          onTap: () =>
                              Get.find<CartController>().addCart(productData),
                          child: const Icon(Icons.add, size: 15),
                        ),
                        _tileButton(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(total.toString(),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        _tileButton(
                          onTap: () =>
                              Get.find<CartController>().minCart(productData),
                          child: const Icon(Icons.remove, size: 15),
                        ),
                        InkWell(
                            onTap: () => Get.find<CartController>()
                                .deleteCart(productData),
                            child: const Icon(Icons.delete, color: Colors.red)),
                      ],
                    ),
                  if (!isBuy)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Material(
                          child: InkWell(
                            onTap: () =>
                                Get.find<CartController>().addCart(productData),
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "Add to cart",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tileButton({required Widget child, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          width: 35,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: child,
        ),
      ),
    );
  }

  static Widget loader() {
    return const _BuildLoader();
  }
}

class _BuildLoader extends StatelessWidget {
  const _BuildLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SkeletonLoaderSquare(
              height: 90,
              width: 90,
              roundedRadius: 8,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SkeletonLoaderSquare(width: 60, height: 10),
                      SizedBox(height: 3),
                      SkeletonLoaderSquare(width: double.infinity, height: 40),
                      SizedBox(height: 3),
                      SkeletonLoaderSquare(width: 60, height: 15),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      SkeletonLoaderSquare(width: 90, height: 25),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
