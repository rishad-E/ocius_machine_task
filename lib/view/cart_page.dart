import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ociuz_task/controller/product_controller.dart';
import 'package:ociuz_task/utils/constant/colors.dart';
import 'package:ociuz_task/widgets/app_bar.dart';
import 'package:ociuz_task/widgets/bottom_nav_bar.dart';
import 'package:ociuz_task/widgets/cart_products.dart';
import 'package:ociuz_task/widgets/snack_bar.dart';
import 'package:ociuz_task/widgets/widgets.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Cart'),
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductController>(
          id: 'update-cart',
          builder: (c) {
            return ListView.separated(
              itemCount: c.cartItems.length,
              itemBuilder: (context, index) {
                final data = c.cartItems[index];
                return CartItems(
                  image: data.image,
                  title: data.title,
                  price: data.price.toString(),
                  quantity: '${c.productQuantities[data.id] ?? 1}',
                  onPressRemove: () => c.removeItemQuantity(data.id),
                  onPressAdd: () => c.addItemQuantity(data.id),
                  onPressDelete: () {
                    c.deleteProduct(index);
                    showCustomSnackbar(
                        title: 'Deleted',
                        message: 'Product deleted from cart',
                        context: context);
                  },
                );
              },
              separatorBuilder: (context, index) => customBox(height: 5),
            );
          },
        ),
      ),
      bottomNavigationBar: Obx(
        () => CartNavBar(price: controller.price.toString()),
      ),
    );
  }
}
