import 'package:explore/_all.dart';

FutureOr main() async {
  await Startup.init();
  runApp(const App());
}
