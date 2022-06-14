class NetworkException implements Exception {
  final int code;
  final String message;
  NetworkException(this.message, {this.code = 500});

  @override
  String toString() {
    return 'NetworkException occured(code:$code) : $message';
  }
}
