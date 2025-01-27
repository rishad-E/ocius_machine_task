import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ociuz_task/utils/constant/colors.dart';
import 'package:ociuz_task/view/cart_page.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:
          BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Colors.grey.shade400, size: 30),
          Icon(Icons.search, color: Colors.grey.shade400, size: 30),
          IconButton(
            onPressed: () => Get.to(() => CartPage()),
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey.shade400,
              size: 30,
            ),
            visualDensity: VisualDensity.compact,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/images/OIP.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CartNavBar extends StatelessWidget {
  final String price;
  const CartNavBar({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '₹ $price',
            style: TextStyle(
                color: kblack, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'proceed to checkout',
                style: TextStyle(color: kblack),
              )),
        ],
      ),
    );
  }
}
