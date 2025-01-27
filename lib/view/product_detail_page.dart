import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ociuz_task/controller/product_controller.dart';
import 'package:ociuz_task/model/product_model.dart';
import 'package:ociuz_task/utils/constant/colors.dart';
import 'package:ociuz_task/view/cart_page.dart';
import 'package:ociuz_task/widgets/app_bar.dart';
import 'package:ociuz_task/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel model;
  DetailsScreen({
    super.key,
    required this.model,
  });

  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('product detail'),
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: const Color.fromARGB(255, 233, 237, 238),
                image: DecorationImage(
                    image: NetworkImage(model.image), fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 115, 115, 115),
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      customBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "⭐ ${model.rating.rate}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 115, 115, 115),
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                          Text(
                            '₹${model.price.toString()}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 115, 115, 115),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      customBox(height: 8),
                      Text(model.description)
                    ],
                  ),
                  customBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: Tooltip(
                            message: 'Go to cart',
                            child: ElevatedButton(
                              onPressed: () => Get.to(() => CartPage()),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: buttonColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      customBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => controller.addtoCart(model),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor),
                            child: Text(
                              controller.cartItems.contains(model)
                                  ? "Added to Cart"
                                  : "Add to Cart",
                              style: TextStyle(
                                  color: kwhite,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
