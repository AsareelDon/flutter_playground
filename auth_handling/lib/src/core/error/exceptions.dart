class ServerError implements Exception {
  final String message;
  ServerError(this.message);
}

class CacheError implements Exception {
  final String message;
  CacheError(this.message);
}

class NetworkError implements Exception {
  final String message;
  NetworkError(this.message);
}

class InvalidInputError implements Exception {
  final String message;
  InvalidInputError(this.message);
}