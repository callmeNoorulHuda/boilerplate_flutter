import 'package:boilerplate_flutter/core/config/app_config.dart';
import 'package:boilerplate_flutter/core/services/base_api_service.dart';
import 'package:boilerplate_flutter/features/home/views/model/product_model.dart';

class ProductService {
  final BaseApiService _apiService = BaseApiService();
  final AppConfig _config = AppConfig();

  Future<List<Product>> fetchAllProducts() async {
    final String endpoint = "${_config.productEndpoint}"; // change if needed

    try {
      final json = await _apiService.getmethod(endpoint);
      Welcome welcome = Welcome.fromJson(json); // Convert whole response
      return welcome.products;
    } catch (e) {
      throw Exception("Failed to load products: $e");
    }
  }
}
