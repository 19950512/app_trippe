abstract class Failure implements Exception {
  String get message;
}

class AuthException extends Failure {
  final String message;
  AuthException({required this.message});
  String toString() => 'AuthException(message: $message)';
}

class ConnectionError extends Failure {
  final String message;
  ConnectionError({required this.message});
  String toString() => 'AuthException(message: $message)';
}
