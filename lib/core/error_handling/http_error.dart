enum HttpError {
  INVALID_ARGUMENT,
  NO_CONNECTION,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_ERROR,
  UNAVAILABLE,
}

extension HttpErrorExtension on HttpError {
  int get value {
    switch (this) {
      case HttpError.INVALID_ARGUMENT:
        return 100;
      case HttpError.NO_CONNECTION:
        return 101;
      case HttpError.BAD_REQUEST:
        return 400;
      case HttpError.UNAUTHORIZED:
        return 401;
      case HttpError.FORBIDDEN:
        return 403;
      case HttpError.NOT_FOUND:
        return 404;
      case HttpError.INTERNAL_ERROR:
        return 500;
      case HttpError.UNAVAILABLE:
        return 503;
      default:
        return 500;
    }
  }

  String get name {
    switch (this) {
      case HttpError.INVALID_ARGUMENT:
        return 'خطا در درخواست ارسالی!';
      case HttpError.NO_CONNECTION:
        return 'اتصال شما به اینترنت برقرار نیست!';
      case HttpError.BAD_REQUEST:
        return '';
      case HttpError.UNAUTHORIZED:
        return 'دسترسی غیرمجاز !';
      case HttpError.FORBIDDEN:
        return 'عدم دسترسی !';
      case HttpError.NOT_FOUND:
        return 'سرویس مورد نظر یافت نشد !';
      case HttpError.INTERNAL_ERROR:
      case HttpError.UNAVAILABLE:
      default:
        return 'خطا در برقراری ارتباط با سرور !';
    }
  }
}
