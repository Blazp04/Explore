import 'package:explore/_all.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController bubbleChatController = TextEditingController();

  @override
  void initState() {
    context.read<PromptSuggestionBloc>().add(PromptSuggestionLoadEvent());
    context.read<UserBloc>().add(UserLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExploreScaffold(
      child: Column(
        children: [
          const Gap(30),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, userState) {
              return Skeletonizer(
                enableSwitchAnimation: true,
                enabled: userState is! UserLoadedState,
                child: AccountCard(
                  imagePath: (userState is UserLoadedState) ? userState.user.imageUrl : 'assets/images/blangPicture.png',
                  name: (userState is UserLoadedState) ? userState.user.name : "Loading...",
                  subtitle: 'Gdje ćemo danas?',
                ),
              );
            },
          ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            width: context.screenWidth - 40,
            height: 160,
            child: BlocBuilder<PromptSuggestionBloc, PromptSuggestionState>(
              builder: (context, promptSuggestionState) {
                return Skeletonizer(
                  enableSwitchAnimation: true,
                  enabled: promptSuggestionState is! PromptSuggestionLoadedState,
                  child: ListView.builder(
                    itemCount: (promptSuggestionState is PromptSuggestionLoadedState) ? promptSuggestionState.promptSuggestions.length : 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => PromptSuggestionCard(
                      onTap: () {},
                      title: (promptSuggestionState is PromptSuggestionLoadedState) ? promptSuggestionState.promptSuggestions[index].title : "Loading...",
                      subTitle: (promptSuggestionState is PromptSuggestionLoadedState) ? promptSuggestionState.promptSuggestions[index].subtitle : "Loading...",
                    ),
                  ),
                );
              },
            ),
          ),
          const Gap(15),
          ChatBubble(
            onChanged: (p0) => bubbleChatController.text = p0,
            onSubmitted: (p0) {
              context.read<ChatBloc>().add(GetSuggestionsEvent(question: p0));
              context.pushNamed(SuggestionsPage.routeName);
            },
          ),
          const Gap(30),
        ],
      ),
    );
  }
}
