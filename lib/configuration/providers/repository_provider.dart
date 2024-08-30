import 'package:explore/_all.dart';
import 'package:explore/domain/repository/chat_repository.dart';

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
      ],
      child: child,
    );
  }
}
