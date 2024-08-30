import 'package:explore/_all.dart';

GetIt services = GetIt.instance;

class Startup {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    AppSettingsConfiguration.configure();

    final appSettings = services.get<AppSettings>();
    services.registerSingleton<DioConfiguration>(DioConfiguration(
      appBaseUrl: appSettings.baseApiUrl,
    ));
  }
}
