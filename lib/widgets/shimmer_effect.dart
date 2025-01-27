import 'package:flutter/material.dart';
import 'package:ociuz_task/utils/constant/colors.dart';
import 'package:shimmer/shimmer.dart';

/*shimmer effect is a custom maded class by utilizing the shimmer package for a smoother ui experience for user while the data fetches*/

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 8,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: kwhite,
              width: double.infinity,
              height: 150,
            ),
          );
        },
      ),
    );
  }
}

class SingleShimmerEfect extends StatelessWidget {
  const SingleShimmerEfect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: kwhite,
          width: double.infinity,
          height: 150,
        ),
      ),
    );
  }
}
