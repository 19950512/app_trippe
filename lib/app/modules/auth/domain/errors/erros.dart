abstract class Failure implements Exception {
  String get message;
}

class AuthException extends Failure {
  @override
  final String message;
  AuthException({required this.message});
  @override
  String toString() => 'AuthException(message: $message)';
}

class ConnectionError extends Failure {
  @override
  final String message;
  ConnectionError({required this.message});
  @override
  String toString() => 'ConnectionError(message: $message)';
}

class ErrorLogout extends Failure {
  @override
  final String message;
  ErrorLogout({required this.message});
  @override
  String toString() => 'AuthException(message: $message)';
}

class InternalError implements Failure {
  @override
  final String message;
  InternalError({required this.message});
  @override
  String toString() => 'AuthException(message: $message)';
}
