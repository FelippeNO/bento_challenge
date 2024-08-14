import 'package:equatable/equatable.dart';

class CoreFailure extends Equatable {
  final List<String> _failureMessages = [];
  List<String> get failureMessages => _failureMessages;

  CoreFailure();

  addFailureMessages(List<String> messages) => _failureMessages.addAll(messages);

  @override
  List<Object?> get props => [_failureMessages];
}
