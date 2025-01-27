import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ociuz_task/view/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    goTohome();
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // color: Colors.yellow,
              height: MediaQuery.of(context).size.height * 0.3,
              // width: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset('assets/images/shop.png'),
            ),
            Text(
              'Let\'s Buy',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> goTohome() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => const HomePage(), transition: Transition.fadeIn);
  }
}
