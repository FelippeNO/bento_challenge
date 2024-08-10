import 'package:bento_challenge/core/utils/mocked_response.dart';
import 'package:bento_challenge/product/data/product_details_data.dart';

class MockedPaths {
  static MockedResponse getDataFromPath(String path, {Map<String, dynamic>? queryParameters}) {
    return switch (path) {
      '/product/details' => MockedResponse(
          statusCode: 200,
          data: _getProductById(queryParameters),
        ),
      _ => MockedResponse(
          statusCode: 404,
          data: {'error': 'Not found'},
        )
    };
  }

  static _getProductById(Map<String, dynamic>? queryParameters) {
    final id = queryParameters!['id'];
    final products = productDetailsData['products'];
    final product = products.firstWhere((product) => product['id'] == id);
    return product;
  }
}
