import 'package:explore/_all.dart';

class AppSettingsConfiguration {
  static void configure() {
    services.registerSingleton<AppSettings>(exploreAppSettings);
  }
}
