import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ociuz_task/controller/product_controller.dart';
import 'package:ociuz_task/view/product_detail_page.dart';
import 'package:ociuz_task/widgets/product_container.dart';
import 'package:ociuz_task/widgets/shimmer_effect.dart';
import 'package:ociuz_task/widgets/snack_bar.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<ProductController>(
        // initState: (state) => controller.getAllProducts(),
        id: 'all-products',
        builder: (c) {
          return c.isLoading
              ? const ShimmerEffect()
              : MasonryGridView.builder(
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 12,
                  itemCount: c.products.length,
                  itemBuilder: (context, index) {
                    final data = c.products[index];
                    return ProductContainer(
                      title: data.title.toString(),
                      image: data.image.toString(),
                      price: data.price.toString(),
                      rating: data.rating.rate.toString(),
                      isAdded: c.cartItems.any((item) => item.id == data.id),
                      addFav: () {
                        c.addtoCart(data);
                        c.cartItems.contains(data)
                            ? showCustomSnackbar(
                                context: context,
                                title: "Product already exists",
                                message: 'Product already exists in the cart',
                              )
                            : showCustomSnackbar(
                                context: context,
                                title: "Added To Cart",
                                message: 'Product added to cart successfully',
                              );
                      },
                      onPressed: () => Get.to(
                        () => DetailsScreen(model: data),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
