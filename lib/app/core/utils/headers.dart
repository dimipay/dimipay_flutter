class HeadersAPI {
  final token;
  HeadersAPI({this.token});
  Map<String, String> getHeaders() {
    return {"Content-Type": "application/json", "Authorization": "Bearer $token"};
  }

  Map<String, String> getAuthorization() {
    return {"Authorization": "Bearer $token"};
  }
}
