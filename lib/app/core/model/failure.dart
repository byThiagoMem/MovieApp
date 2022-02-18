import 'package:dio/dio.dart';

abstract class Failure {
  Failure._();

  factory Failure.dioFailure(DioError error) = DioFailure;
  factory Failure.dataFailure(String value) = DataFailure;
  factory Failure.unknownFailure(dynamic error) = UnknownFailure;

  String get message;
}

class DioFailure extends Failure {
  DioFailure(this.error) : super._();

  final DioError error;

  @override
  String get message => error.message;
}

class DataFailure extends Failure {
  DataFailure(this.value) : super._();

  final String value;

  @override
  String get message => value;
}

class UnknownFailure extends Failure {
  UnknownFailure(this.value) : super._();

  final dynamic value;

  @override
  String get message => 'Ocorreu um erro';
}
