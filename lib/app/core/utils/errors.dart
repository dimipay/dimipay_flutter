class OnboardingTokenException implements Exception {
  final String message;
  OnboardingTokenException(this.message);
}

class RefreshTokenException implements Exception {
  final String message;
  RefreshTokenException({this.message = ''});
}
