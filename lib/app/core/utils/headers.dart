class HeadersAPI {
  Map<String, String> getHeaders() {
    return {"Content-Type": "application/json"};
  }

  Map<String, String> getAuthorization() {
    String token = "";
    return {"Authorization": "Bearer $token"};
  }
}
