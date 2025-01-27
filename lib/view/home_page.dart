import 'package:flutter/material.dart';
import 'package:ociuz_task/utils/constant/colors.dart';
import 'package:ociuz_task/view/product_page.dart';
import 'package:ociuz_task/widgets/app_bar.dart';
import 'package:ociuz_task/widgets/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget('Products'),
        backgroundColor:bgColor,
        body:  Stack(
          children: [
            ProductPage(),
            const Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: BottomNav(),
            ),
          ],
        ),
      ),
    );
  }
}
