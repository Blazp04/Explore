import 'package:explore/_all.dart';

class SuggestionChatCard extends StatelessWidget {
  const SuggestionChatCard({
    required this.question,
    required this.answer,
    required this.suggestions,
    required this.questionAnswers,
    required this.type,
    super.key,
  });

  final String question;
  final String answer;
  final List<PlacesModel> suggestions;
  final List<String> questionAnswers;
  final String type;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(20),
        // height: 410,
        // width: context.screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF3C3B42).withOpacity(0.25),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(
                color: AppColors.titleColor,
                fontWeight: FontWeight.normal,
                fontSize: 23,
              ),
              textAlign: TextAlign.left,
            ),
            const Gap(8),
            IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: context.screenWidth - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF6F8FC),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF3C3B42).withOpacity(0.25),
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      answer,
                      style: TextStyle(
                        color: AppColors.titleColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const Gap(10),
                    SizedBox(
                      height: type == 'answer' ? 200 : 100,
                      child: ListView.builder(
                        itemCount: type == 'answer' ? suggestions.length : questionAnswers.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (type == 'answer') {
                            return SuggestionCard(
                              imagePath: suggestions[index].imageUrl,
                              name: suggestions[index].name,
                              onTap: () {},
                            );
                          }
                          return AnswerSuggestions(
                            onTap: () {
                              final model = ChatHistoryRequestmodel(
                                userQuestion: question,
                                textFromGPT: answer,
                                userAnswer: questionAnswers[index],
                              );
                              context.read<ChatBloc>().add(AnswerToSuggestedtQuestionEvent(model: model));
                            },
                            title: questionAnswers[index],
                          );
                        },
                      ),
                    ),
                    Gap(15)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AnswerSuggestions extends StatefulWidget {
  const AnswerSuggestions({
    required this.onTap,
    required this.title,
    super.key,
  });

  @override
  final void Function() onTap;
  final String title;

  @override
  State<AnswerSuggestions> createState() => _AnswerSuggestionsState();
}

class _AnswerSuggestionsState extends State<AnswerSuggestions> {
  Color backgrondColor = Color(0xFFFFFFFF);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        backgrondColor = AppColors.backGround2;
        setState(() {});
        widget.onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: backgrondColor,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3C3B42).withOpacity(0.25),
                blurRadius: 4,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: AppColors.titleColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
