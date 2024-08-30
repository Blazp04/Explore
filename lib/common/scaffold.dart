import 'package:explore/_all.dart';

class ExploreScaffold extends StatelessWidget {
  const ExploreScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: SingleChildScrollView(
            child: Container(
              width: context.screenHeight,
              height: context.screenHeight,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.backGround,
                    AppColors.backGround2,
                  ],
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
