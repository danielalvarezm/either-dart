class Either<F, V> {
  final F? failure;
  final V? value;

  Either._(this.failure, this.value);

  bool get isSuccess => failure == null;

  bool get isFailure => failure != null;

  factory Either.success(V value) {
    return Either._(null, value);
  }

  factory Either.failure(F failure) {
    return Either._(failure, null);
  }

  V getOrElse(V defaultValue) {
    return value ?? defaultValue;
  }

  V fold(V Function(F failure) onFailure, V Function(V value) onSuccess) {
    if (isSuccess) {
      return onSuccess(value!);
    } else {
      return onFailure(failure!);
    }
  }
}
