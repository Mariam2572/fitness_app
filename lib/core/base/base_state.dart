sealed class BaseState<T> {
  BaseState();
}

class BaseInitial<T> extends BaseState<T> {
  BaseInitial();
}

class BaseLoading<T> extends BaseState<T> {
  BaseLoading();
}

class BaseError<T> extends BaseState<T> {
  final String? errorMessage;

  BaseError({this.errorMessage});
}

class BaseSuccess<T> extends BaseState<T> {
  final T? data;
  BaseSuccess({this.data});
}
