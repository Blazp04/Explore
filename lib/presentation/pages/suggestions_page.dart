import 'package:explore/_all.dart';

class SuggestionsPage extends StatelessWidget {
  SuggestionsPage({super.key});
  static String routeName = '/suggestions';

  final TextEditingController bubbleChatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ExploreScaffold(
      child: Column(
        children: [
          BlocBuilder<ChatBloc, ChatState>(
            builder: (context, chatState) {
              return Skeletonizer(
                enableSwitchAnimation: true,
                enabled: chatState.status != ChatStateStatus.loaded,
                child: SuggestionChatCard(
                  question: chatState.questions?[0] ?? '',
                  answer: chatState.suggestionModel?[0].text ?? '',
                  suggestions: chatState.suggestionModel?[0].placesModel ?? [],
                  questionAnswers: chatState.suggestionModel?[0].answers ?? [],
                  type: chatState.suggestionModel?[0].actionType ?? '',
                ),
              );
            },
          ),
          Expanded(
            child: Container(),
          ),
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
