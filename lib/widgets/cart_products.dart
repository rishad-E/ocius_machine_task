// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ociuz_task/utils/constant/colors.dart';

class CartItems extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String quantity;
  void Function()? onPressRemove;
  void Function()? onPressAdd;
  void Function()? onPressDelete;
  CartItems(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.quantity,
      this.onPressRemove,
      this.onPressAdd,
      this.onPressDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Image.network(
            image,
            fit: BoxFit.contain,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const Text(
                  'size: XL',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  price,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: onPressRemove, icon: const Icon(Icons.remove)),
              Text(
                quantity,
                style: TextStyle(
                    color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(onPressed: onPressAdd, icon: const Icon(Icons.add)),
              const SizedBox(width: 8),
              IconButton(
                onPressed: onPressDelete,
                icon: const Icon(Icons.delete),
              )
            ],
          ),
        ],
      ),
    );
  }
}
