import 'package:explore/_all.dart';

extension ContextExtensions on BuildContext {
  void pop() => Navigator.of(this).pop();
  void pushNamed(String routeName) {
    Navigator.of(this).pushNamed(routeName);
  }

  void popUntillroot() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  ThemeData get theme => Theme.of(this);
}
