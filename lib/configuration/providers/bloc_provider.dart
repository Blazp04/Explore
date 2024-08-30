import 'package:explore/_all.dart';

class BlocProviderConfig extends StatelessWidget {
  const BlocProviderConfig({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(chatRepository: RepositoryProvider.of<IChatRepository>(context)),
        ),
        BlocProvider<PromptSuggestionBloc>(
          create: (context) => PromptSuggestionBloc(
            promptSuggestionRepository: RepositoryProvider.of<IPromptSuggestionRepository>(context),
          ),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(
            userRepository: RepositoryProvider.of<IUserRepository>(context),
          ),
        ),
      ],
      child: child,
    );
  }
}
