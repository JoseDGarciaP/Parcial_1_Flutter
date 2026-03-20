import 'package:dio/dio.dart';
import 'package:parcial_1/const/product_const.dart';
import 'package:parcial_1/model/product_model.dart';


class ProductService {
  final _dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    final response = await _dio.get(productsConst);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['products'];
      return data.map((json) => ProductModel.fromJson(json)).toList();
    }
    return [];
  }

  Future<ProductModel?> getProductById(int id) async {
    final response = await _dio.get('$productsConst/$id');
    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    }
    return null;
  }
}
