import 'dart:math';

import 'package:bento_challenge/core/clients/mocked_paths.dart';
import 'package:bento_challenge/core/utils/mocked_response.dart';

abstract class IMockedClient {
  Future<MockedResponse> get(String path, {Map<String, dynamic>? queryParameters});
}

class CoreMockedClient implements IMockedClient {
  @override
  Future<MockedResponse> get(String path, {Map<String, dynamic>? queryParameters}) async {
    await Future.delayed(Duration(milliseconds: _generateRandomMillisecondsDelay()));
    return MockedPaths.getDataFromPath(path, queryParameters: queryParameters);
  }

  int _generateRandomMillisecondsDelay() {
    final Random random = Random();
    const int min = 300;
    const int max = 1500;
    return min + random.nextInt(max - min);
  }
}
