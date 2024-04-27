class AppIcon {
  static const String iconGoogle = "google_icon";
  static const String iconApple = "apple_icon";
}

extension AppiconAsset on String {
  String get assetPath => 'assets/icons/$this.png';
}
