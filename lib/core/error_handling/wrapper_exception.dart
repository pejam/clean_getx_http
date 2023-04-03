
import '../model/wrapper_error.dart';
import '../model/wrapper_response.dart';
import 'http_error.dart';

class WrapperException {
  static WrapperError badRequest(WrapperResponse wrapperResponse) {
    return WrapperError(
      statusCode: wrapperResponse.statusCode,
      message: wrapperResponse.message,
      description: wrapperResponse.description,
      type: wrapperResponse.type,
      systemErrorId: wrapperResponse.systemErrorId,
    );
  }

  static WrapperError handleWrapperException(HttpError httpError) {
    return WrapperError(
      statusCode: httpError.value,
      message: httpError.name,
      description: null,
      type: 0,
      systemErrorId: 0,
    );
  }
}
