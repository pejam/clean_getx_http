import 'package:dartz/dartz.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sample_flutter/core/failure.dart';

enum ApiState { loading, failure, success }

mixin BaseController {
  Rx<ApiState> apiStatus = ApiState.loading.obs;
  Rx<Failure>? error;
  Rx<Type>? response;

  _checkFailureOrSuccess(Either<Failure, dynamic> failureOrSuccess) {
    failureOrSuccess.fold(
      (Failure failure) {
        apiStatus.value = ApiState.failure;
        //errorMessage = failure.obs;
      },
      (dynamic success) {
        apiStatus.value = ApiState.success;
      },
    );
  }

  void callApi(Future<Either<Failure, dynamic>> apiCallback) async {
    apiStatus.value = ApiState.loading;
    Either<Failure, dynamic> failureOrSuccess = await apiCallback;
    _checkFailureOrSuccess(failureOrSuccess);
  }

}
