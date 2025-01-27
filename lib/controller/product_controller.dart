import 'dart:developer';

import 'package:get/get.dart';
import 'package:ociuz_task/model/product_model.dart';
import 'package:ociuz_task/service/product_service.dart';

class ProductController extends GetxController {
  final RxList<ProductModel> _products = <ProductModel>[].obs;
  final RxList<ProductModel> _cartItems = <ProductModel>[].obs;

  List<ProductModel> get products => _products;
  List<ProductModel> get cartItems => _cartItems;

  //productquantities is used to get the quantity of the product we want to purchase
  Map<int, int> productQuantities = {};
  bool isLoading = false;
  RxDouble price = 0.0.obs;

   @override
  void onInit() {
    super.onInit();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    try {
      isLoading = true;
      List<ProductModel>? data = await ProductService().fetchProduct();
      if (data != null) {
        products.assignAll(data);
        update(['all-products']);
      }
    } catch (e) {
      log(e.toString(), name: 'c-error');
    } finally {
      isLoading = false;
    }
  }

  void addtoCart(ProductModel model) {
    if (!_cartItems.any((item) => item.id == model.id)) {
      _cartItems.add(model);
      productQuantities[model.id] = 1;
      /* the model passed to the function is checked if the product exists in the cart or not, 
      If exists the product is not added but the quantity is incremented by 1 and if the product not exists,
      the item is added to the cartItems list and in the productQuantities item is added with quantity as 1  */
    } else {
      productQuantities[model.id] = productQuantities[model.id]! + 1;
    }
    totalPrice();
    update(['all-products']);
    update(['update-cart']);
  }

  void addItemQuantity(int productId) {
    /*function is used to increment the quantity by 1 in the cart screen 
    by checking the product id */
    if (productQuantities.containsKey(productId)) {
      productQuantities[productId] = productQuantities[productId]! + 1;
      totalPrice();
      update(['update-cart']);
    }
  }

  void removeItemQuantity(int productId) {
    /* function is used to decremment the quanty by 1*/
    if (productQuantities.containsKey(productId) &&
        productQuantities[productId]! > 1) {
      productQuantities[productId] = productQuantities[productId]! - 1;
      totalPrice();
      update(['update-cart']);
    }
  }

  void deleteProduct(int index) {
    cartItems.removeAt(index);
    totalPrice();
    update(['all-products']);
    update(['update-cart']);
  }

  void totalPrice() {
    /* this function is used to get the total price of the product 
    which is calculated by checking the cart list along with the quantities added inthe productQuantities*/
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * (productQuantities[item.id] ?? 1);
    }
    price.value = total.roundToDouble();
  }
}
