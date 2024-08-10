class CoreFailure {
  final List<String> _failureMessages = [];
  List<String> get failureMessages => _failureMessages;

  CoreFailure();

  addFailureMessages(List<String> messages) => _failureMessages.addAll(messages);
}
