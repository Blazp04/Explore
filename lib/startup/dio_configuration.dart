// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:explore/_all.dart';

class DioConfiguration {
  final appSettings = services.get<AppSettings>();

  late Dio dio;
  String authToken;
  String appBaseUrl;
  String appLanguage;

  DioConfiguration({
    this.authToken = '',
    this.appLanguage = '',
    this.appBaseUrl = '',
  }) {
    configure();
  }

  void configure() {
    dio = Dio(BaseOptions(
      baseUrl: appBaseUrl,
      headers: {
        'Content-Type': 'application/json',
        'content-type': 'application/json; charset=utf-8',
        'contentType': 'application/json; charset=utf-8',
      },
    ));
  }
}
