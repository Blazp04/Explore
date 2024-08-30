import 'package:explore/_all.dart';

class BlocProviderConfig extends StatelessWidget {
  const BlocProviderConfig({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChatBloc(),
        )
      ],
      child: child,
    );
  }
}
