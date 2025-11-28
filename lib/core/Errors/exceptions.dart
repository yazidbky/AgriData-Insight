import 'package:dio/dio.dart';
import 'package:makers_hackathon/core/Errors/error_model.dart';

//!ServerException
class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException(this.errorModel);
}

//!CacheExeption
class CacheExeption implements Exception {
  final String errorMessage;
  CacheExeption({required this.errorMessage});
}

class BadCertificateException extends ServerException {
  BadCertificateException(super.errorModel);
}

class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException(super.errorModel);
}

class BadResponseException extends ServerException {
  BadResponseException(super.errorModel);
}

class ReceiveTimeoutException extends ServerException {
  ReceiveTimeoutException(super.errorModel);
}

class ConnectionErrorException extends ServerException {
  ConnectionErrorException(super.errorModel);
}

class SendTimeoutException extends ServerException {
  SendTimeoutException(super.errorModel);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException(super.errorModel);
}

class ForbiddenException extends ServerException {
  ForbiddenException(super.errorModel);
}

class NotFoundException extends ServerException {
  NotFoundException(super.errorModel);
}

class CofficientException extends ServerException {
  CofficientException(super.errorModel);
}

class CancelException extends ServerException {
  CancelException(super.errorModel);
}

class UnknownException extends ServerException {
  UnknownException(super.errorModel);
}

void handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionError:
      throw ConnectionErrorException(
        ErrorModel(
          status: 0,
          errorMessage:
              'Cannot connect to server. Please check your internet connection.',
        ),
      );
    case DioExceptionType.badCertificate:
      throw BadCertificateException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(
        ErrorModel(
          status: 0,
          errorMessage: 'Connection timeout. Please try again.',
        ),
      );

    case DioExceptionType.receiveTimeout:
      throw ReceiveTimeoutException(ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.sendTimeout:
      throw SendTimeoutException(ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode ?? 0;
      final responseData = e.response?.data;

      // Try to parse the error response
      String errorMessage = 'Server error occurred';
      if (responseData is Map<String, dynamic>) {
        errorMessage = responseData['message'] ?? errorMessage;
      }

      switch (statusCode) {
        case 400:
          throw BadResponseException(
            ErrorModel(status: statusCode, errorMessage: errorMessage),
          );
        case 401:
          throw UnauthorizedException(
            ErrorModel(status: statusCode, errorMessage: 'Unauthorized access'),
          );
        case 403:
          throw ForbiddenException(
            ErrorModel(status: statusCode, errorMessage: 'Access forbidden'),
          );
        case 404:
          throw NotFoundException(
            ErrorModel(status: statusCode, errorMessage: 'Service not found'),
          );
        case 409:
          throw CofficientException(
            ErrorModel(
              status: statusCode,
              errorMessage: 'Data conflict - may already exist',
            ),
          );
        case 500:
          throw ServerException(
            ErrorModel(
              status: statusCode,
              errorMessage: errorMessage.isNotEmpty
                  ? errorMessage
                  : 'Internal server error',
            ),
          );
        default:
          throw ServerException(
            ErrorModel(
              status: statusCode,
              errorMessage: 'Server error ($statusCode): $errorMessage',
            ),
          );
      }

    case DioExceptionType.cancel:
      throw CancelException(
        ErrorModel(errorMessage: e.toString(), status: 500),
      );

    case DioExceptionType.unknown:
      throw UnknownException(
        ErrorModel(errorMessage: e.toString(), status: 500),
      );
  }
}