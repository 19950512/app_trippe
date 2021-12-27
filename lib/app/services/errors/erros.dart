abstract class Failure implements Exception {
  String get message;
}

class ConnectionError extends Failure {
  @override
  final String message;
  ConnectionError({required this.message});
  @override
  String toString() => 'ConnectionError(message: $message)';
}
