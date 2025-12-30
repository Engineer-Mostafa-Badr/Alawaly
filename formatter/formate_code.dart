// dart format .
// flutter analyze
// dart fix --dry-run
// dart fix --apply
// flutter build appbundle --release
// flutter pub deps -- --style=tree
// flutter run --profile
// flutter test --coverage

class FlutterCommands {
  // Project Setup & Creation
  static const projectSetup = [
    'flutter create my_app',
    'flutter create --platforms=android,ios,web my_app',
    'flutter channel',
    'flutter channel stable',
    'flutter upgrade',
    'flutter downgrade',
  ];

  // Build Commands
  static const buildCommands = [
    'flutter build apk',
    'flutter build apk --release',
    'flutter build appbundle',
    'flutter build ios',
    'flutter build ipa',
    'flutter build web',
    'flutter build windows',
    'flutter build macos',
    'flutter build linux',
  ];

  // Running & Building Apps
  static const running = [
    'flutter run',
    'flutter run -d chrome',
    'flutter run -d emulator-5554',
    'flutter run --release',
    'flutter run --profile',
  ];

  // Devices & Emulators
  static const devices = [
    'flutter devices',
    'flutter emulators',
    'flutter emulators --launch emulator_id',
    'flutter doctor',
    'flutter doctor --android-licenses',
  ];

  // Dependencies
  static const dependencies = [
    'flutter pub get',
    'flutter pub upgrade',
    'flutter pub outdated',
    'flutter pub add package_name',
    'flutter pub remove package_name',
  ];

  // Testing & Analysis
  static const testing = [
    'flutter test',
    'flutter analyze',
    'flutter format .',
  ];

  // Cleaning & Repair
  static const cleaning = [
    'flutter clean',
    'flutter pub cache repair',
    'flutter pub cache clean',
  ];

  // Hot Reload & Restart
  static const hotReload = ['r   // Hot reload', 'R   // Full restart'];

  // Misc
  static const misc = ['flutter logs', 'flutter config --enable-web'];
}
