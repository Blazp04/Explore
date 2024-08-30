import 'package:explore/_all.dart';

class SuggestionsPage extends StatelessWidget {
  SuggestionsPage({super.key});

  final TextEditingController bubbleChatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ExploreScaffold(
      child: Column(
        children: [
          const SuggestionChatCard(
            question: 'Što danas ima u Mostaru',
            answer: 'Danas u mostaru nema brate ništa',
          ),
          Expanded(
            child: Container(),
          ),
          ChatBubble(
            onChanged: (p0) => bubbleChatController.text = p0,
          ),
          const Gap(30),
        ],
      ),
    );
  }
}
