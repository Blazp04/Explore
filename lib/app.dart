import 'package:explore/_all.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProviderConfig(
      child: BlocProviderConfig(
        child: MaterialApp(
          title: 'Explore',
          debugShowCheckedModeBanner: false,
          // theme: theme,
          home: Placeholder(),
          routes: AppRoutes.routes,
        ),
      ),
    );
  }
}
