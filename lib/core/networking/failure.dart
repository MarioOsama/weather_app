class Failure {
  final int code;
  final String message;

  Failure(this.code, this.message);

  @override
  String toString() {
    return 'Failure(code: $code, message: $message)';
  }
}
