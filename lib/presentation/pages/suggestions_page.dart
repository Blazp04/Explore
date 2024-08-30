import 'package:explore/_all.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
                ),
              );
            },
          ),
          Expanded(
            child: Container(),
          ),
          Hero(
            tag: 'chatBubble',
            child: ChatBubble(
              onChanged: (p0) => bubbleChatController.text = p0,
              onSubmitted: (p0) => print("RADIIII!!!!"),
            ),
          ),
          const Gap(30),
        ],
      ),
    );
  }
}
