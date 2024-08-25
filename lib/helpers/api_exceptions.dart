// Base class for all API exceptions
sealed class APIException implements Exception {
  APIException(this.message);
  final String message;

  @override
  String toString() => message;
}

// Specific exceptions with customizable messages
class InvalidApiKeyException extends APIException {
  InvalidApiKeyException({String? message})
      : super(message ?? 'Invalid API key');
}

class NoInternetConnectionException extends APIException {
  NoInternetConnectionException({String? message})
      : super(message ?? 'No Internet connection');
}

class NotFoundException extends APIException {
  NotFoundException({String? message}) : super(message ?? 'element not found');
}

class UnknownException extends APIException {
  UnknownException({String? message}) : super(message ?? 'Some error occurred');
}

void handleApiError(int errorCode, {String? customMessage}) {
  switch (errorCode) {
    case 401:
      throw InvalidApiKeyException(message: customMessage);
    case 404:
      throw NotFoundException(message: customMessage);
    case 0:
      throw NoInternetConnectionException(message: customMessage);
    default:
      throw UnknownException(message: customMessage);
  }
}
