import 'package:explore/_all.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController bubbleChatController = TextEditingController();

  @override
  void initState() {
    context.read<PromptSuggestionBloc>().add(PromptSuggestionLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExploreScaffold(
      child: Column(
        children: [
          const Gap(30),
          const AccountCard(
            imagePath: 'assets/images/blaz.jpg',
            name: 'Blaž',
            subtitle: 'Gdje ćemo danas?',
          ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            width: context.screenWidth - 40,
            height: 160,
            child: BlocBuilder<PromptSuggestionBloc, PromptSuggestionState>(
              builder: (context, promptSuggestionState) {
                if (promptSuggestionState is! PromptSuggestionLoadedState) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: promptSuggestionState.promptSuggestions.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => PromptSuggestionCard(
                    onTap: () {},
                    title: promptSuggestionState.promptSuggestions[index].title,
                    subTitle: promptSuggestionState.promptSuggestions[index].subtitle,
                  ),
                );
              },
            ),
          ),
          const Gap(15),
          ChatBubble(
            onChanged: (p0) => bubbleChatController.text = p0,
          ),
          const Gap(30),
        ],
      ),
    );
  }
}
