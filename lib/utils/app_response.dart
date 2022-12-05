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

    return AppResponseModel(
        error: error.toString(), message: message ?? "Неизвестная ощибка");
  }

  AppResponse.ok({dynamic body, String? message})
      : super.ok(AppResponseModel(data: body, message: message));

  AppResponse.badRequest({dynamic body, String? message})
      : super.badRequest(body: AppResponseModel(data: body, message: message));

  AppResponse.unauthorized({dynamic body, String? message})
      : super.unauthorized(
            body: AppResponseModel(data: body, message: message));
}
