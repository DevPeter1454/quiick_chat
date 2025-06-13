import 'dart:async';
import 'dart:io';

class Failure {
  final String message;
  final dynamic exception;
  final StackTrace? stackTrace;

  Failure(this.message, {this.exception, this.stackTrace});

  @override
  String toString() => message;
}

class InternalFailure extends Failure {
  InternalFailure({dynamic exception, StackTrace? stackTrace})
      : super('Internal error, contact support',
            exception: exception, stackTrace: stackTrace);
}

class NetworkFailure extends Failure {
  NetworkFailure(
      {String? customMessage, dynamic exception, StackTrace? stackTrace})
      : super(customMessage ?? 'Network error, please check your connection',
            exception: exception, stackTrace: stackTrace);
}

class TimeoutFailure extends Failure {
  TimeoutFailure(
      {String? customMessage, dynamic exception, StackTrace? stackTrace})
      : super(customMessage ?? 'Request timed out, please try again',
            exception: exception, stackTrace: stackTrace);
}

class SocketFailure extends Failure {
  SocketFailure(
      {String? customMessage, dynamic exception, StackTrace? stackTrace})
      : super(customMessage ?? 'Connection error, please check your network',
            exception: exception, stackTrace: stackTrace);
}

class FormatFailure extends Failure {
  FormatFailure(
      {String? customMessage, dynamic exception, StackTrace? stackTrace})
      : super(customMessage ?? 'Data format error, please try again later',
            exception: exception, stackTrace: stackTrace);
}

class AuthFailure extends Failure {
  AuthFailure(
      {String? customMessage, dynamic exception, StackTrace? stackTrace})
      : super(customMessage ?? 'Authentication error, please login again',
            exception: exception, stackTrace: stackTrace);
}

class ServerFailure extends Failure {
  final int? statusCode;

  ServerFailure(
      {String? customMessage,
      this.statusCode,
      dynamic exception,
      StackTrace? stackTrace})
      : super(customMessage ?? 'Server error, please try again later',
            exception: exception, stackTrace: stackTrace);
}

class ValidationFailure extends Failure {
  final int? statusCode;

  ValidationFailure(
      {String? customMessage,
      this.statusCode,
      dynamic exception,
      StackTrace? stackTrace})
      : super(customMessage ?? 'Validation failed',
            exception: exception, stackTrace: stackTrace);
}

// Helper function to convert exceptions to appropriate Failure types
Failure handleException(dynamic exception, [StackTrace? stackTrace]) {
  if (exception is TimeoutException) {
    return TimeoutFailure(exception: exception, stackTrace: stackTrace);
  } else if (exception is SocketException) {
    return SocketFailure(exception: exception, stackTrace: stackTrace);
  } else if (exception is FormatException) {
    return FormatFailure(exception: exception, stackTrace: stackTrace);
  } else {
    return InternalFailure(exception: exception, stackTrace: stackTrace);
  }
}
