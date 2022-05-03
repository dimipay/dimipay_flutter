class NetworkExcepton implements Exception {
  final int code;
  final String message;
  NetworkExcepton(this.message, {this.code = 500});

  @override
  String toString() {
    return 'NetworkException occured(code:$code) : ' + message;
  }
}
