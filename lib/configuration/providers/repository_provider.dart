import 'package:explore/_all.dart';

class RepositoryProviderConfig extends StatelessWidget {
  const RepositoryProviderConfig({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IChatRepository>(
          create: (BuildContext context) => ChatRepository(),
        ),
        RepositoryProvider<IPromptSuggestionRepository>(
          create: (BuildContext context) => (PromptSuggestionRepository()),
        ),
        RepositoryProvider<IUserRepository>(
          create: (BuildContext context) => (UserRepository()),
        ),
      ],
      child: child,
    );
  }
}
