import 'package:dio/dio.dart';

import '../../../core/model/failure.dart';
import '../../../core/model/result.dart';

extension FutureExtension on Future<Response> {
  Future<Result<R>> result<R>(
      R Function(Map<String, dynamic> json) onValue) async {
    try {
      var response = await this;
      return Result.success(onValue(response.data));
    } on DioError catch (e) {
      return Result.error(Failure.dioFailure(e));
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return Result.error(Failure.unknownFailure(e));
    }
  }

  Future<Result<R>> fullResult<R>(
      R Function(Map<String, dynamic> json) onValue) async {
    try {
      var response = await this;
      return Result.success(onValue(response.data));
    } on DioError catch (e) {
      return Result.error(Failure.dioFailure(e));
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return Result.error(Failure.unknownFailure(e));
    }
  }

  Future<Result<R>> resultList<R>(
      R Function(List<dynamic> list) onValue) async {
    try {
      var response = await this;
      return Result.success(onValue(response.data));
    } on DioError catch (e) {
      return Result.error(Failure.dioFailure(e));
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return Result.error(Failure.unknownFailure(e));
    }
  }
}
