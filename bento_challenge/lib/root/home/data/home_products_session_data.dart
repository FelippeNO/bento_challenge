import 'package:bento_challenge/product/data/product_details_data.dart';

Map<String, dynamic> homeProductsSessionData = {
  'sessions': [
    {
      'name': 'Today\'s Special',
      'products': productDetailsData['products'],
    },
  ],
};
