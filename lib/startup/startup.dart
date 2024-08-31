import 'package:explore/_all.dart';

GetIt services = GetIt.instance;

class Startup {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    AppSettingsConfiguration.configure();

    // services.registerSingleton<DioConfiguration>(DioConfiguration());
  }
}
