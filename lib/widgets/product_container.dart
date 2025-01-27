import 'package:flutter/material.dart';
import 'package:ociuz_task/utils/constant/colors.dart';
import 'package:shimmer/shimmer.dart';

class ProductContainer extends StatelessWidget {
  final String title;
  final String image;
  final String rating;
  final String price;
  final bool isAdded;
  final void Function()? onPressed;
  final void Function()? addFav;
  const ProductContainer({
    super.key,
    required this.image,
    required this.onPressed,
    required this.title,
    required this.rating,
    required this.price,
    required this.isAdded,
    required this.addFav,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: boxColor,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    // height: 180,
                    width: double.infinity,
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: Colors.white,
                              height: 180,
                              width: 50,
                            ),
                          );
                        }
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "⭐ $rating",
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                            onPressed: addFav,
                            icon: isAdded
                                ? const Icon(Icons.favorite, color: Colors.red)
                                : const Icon(Icons.favorite_outline),
                            style: const ButtonStyle(
                                visualDensity: VisualDensity.compact),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Text(price),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
