import 'package:flutter/foundation.dart';

abstract class CoreException implements Exception {
  List<String> get failureMessages => _failuresMessages;

  final List<String> _failuresMessages = [];

  printE() {
    debugPrintStack(label: 'Exception :: $runtimeType', stackTrace: StackTrace.current);
  }

  addFailureMessage(String message) {
    try {
      _failuresMessages.add(message);
    } catch (e) {
      _failuresMessages.add('Erro inesperado!');
      printE();
    }
  }
}
