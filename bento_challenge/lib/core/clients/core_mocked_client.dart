import 'package:bento_challenge/core/clients/mocked_paths.dart';
import 'package:bento_challenge/core/utils/mocked_response.dart';

const globalMillisecondsDelay = 1000;

abstract class IMockedClient {
  Future<MockedResponse> get(String path, {Map<String, dynamic>? queryParameters});
}

class CoreMockedClient implements IMockedClient {
  @override
  Future<MockedResponse> get(String path, {Map<String, dynamic>? queryParameters}) async {
    await Future.delayed(const Duration(milliseconds: globalMillisecondsDelay));
    return MockedPaths.getDataFromPath(path, queryParameters: queryParameters);
  }
}
