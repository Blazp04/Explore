import 'package:explore/_all.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    HomePage.routeName: (context) => const HomePage(),
    SuggestionsPage.routeName: (context) => SuggestionsPage(),
  };
}
