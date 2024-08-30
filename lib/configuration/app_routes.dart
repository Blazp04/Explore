import 'package:explore/_all.dart';
import 'package:explore/presentation/_all.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    HomePage.routeName: (context) => HomePage(),
    SuggestionsPage.routeName: (context) => SuggestionsPage(),
  };
}
