class OnboardingTokenException implements Exception {
  final String message;
  OnboardingTokenException(this.message);
}

class RefreshTokenException implements Exception {
  final String message;
  RefreshTokenException({this.message = ''});
}

class FaceSginException implements Exception {
  final String message;
  FaceSginException(this.message);
}

class IncorrectPinException implements Exception {
  final String message;
  final int left;
  IncorrectPinException(this.message, this.left);
}

class PinLockException implements Exception {
  final String message;
  PinLockException(this.message);
}
