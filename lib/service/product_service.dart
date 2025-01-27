import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ociuz_task/model/product_model.dart';
import 'package:ociuz_task/utils/constant/api/api.dart';

class ProductService {
  Dio dio = Dio();
  String path = Apis().baseUrl + Apis().products;

  Future<List<ProductModel>?> fetchProduct() async {
    try {
      Response response = await dio.get(
        path,
        options: Options(validateStatus: (status) => status! < 599),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        /*This is a mapping function that converts a collection of response data into a list of ProductModel objects by each element*/
        final res = data.map((e) => ProductModel.fromJson(e)).toList();
        log(res.toString());
        return res;
      }
    } catch (e) {
      log(e.toString(), name: 'service error');
    }
    return null;
  }
}
