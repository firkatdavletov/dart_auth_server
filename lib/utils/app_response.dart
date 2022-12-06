import 'package:conduit/conduit.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../models/response_model.dart';

class AppResponse extends Response {
  AppResponse.serverError(dynamic error, {String? message})
      : super.serverError(body: _getResponseModel(error, message));

  static AppResponseModel _getResponseModel(error, String? message) {
    if (error is QueryException) {
      return AppResponseModel(
          error: error.toString(), message: message ?? error.message);
    }

    if (error is JwtException) {
      return AppResponseModel(
          error: error.toString(), message: message ?? error.message);
    }

    if (error is AuthorizationParserException) {
      return AppResponseModel(
          error: error.toString(), message: message ?? error.toString());
    }

    return AppResponseModel(
        error: error.toString(), message: message ?? "Неизвестная ошибка");
  }

  AppResponse.ok({dynamic body, String? message})
      : super.ok(AppResponseModel(data: body, message: message));

  AppResponse.badRequest({String? message})
      : super.badRequest(
            body: AppResponseModel(message: message ?? "Ошибка запроса"));

  AppResponse.unauthorized(dynamic error, {String? message})
      : super.unauthorized(body: _getResponseModel(error, message));
}
