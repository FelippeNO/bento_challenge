import 'package:bento_challenge/product/domain/services/get_product_details_by_id_service.dart';
import 'package:flutter/material.dart';

class ProductDetailsController extends ChangeNotifier {
  final GetProductDetailsByIdService _getProductDetailsByIdService;

  ProductDetailsController(this._getProductDetailsByIdService);

  initialize() async {
    final result = await _getProductDetailsByIdService.call(1);
    result.fold(
      (error) {},
      (product) {},
    );
  }
}
