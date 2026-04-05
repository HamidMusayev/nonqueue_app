sealed class Result<T> {
  const Result._();
}

final class Success<T> extends Result<T> {
  final T? data;
  final String message;

  const Success(this.data, {this.message = 'Successful'}) : super._();
}

final class Failure<T> extends Result<T> {
  final String message;

  const Failure(this.message) : super._();
}

extension ResultX<T> on Result<T> {
  bool get success => this is Success<T>;

  String get message => switch (this) {
        Success(:final message) => message,
        Failure(:final message) => message,
      };

  T? get data => switch (this) {
        Success(:final data) => data,
        Failure() => null,
      };
}
