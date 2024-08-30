import 'package:explore/_all.dart';
import 'package:flutter/material.dart';

class SuggestionChatCard extends StatelessWidget {
  const SuggestionChatCard({
    required this.question,
    required this.answer,
    required this.suggestions,
    super.key,
  });

  final String question;
  final String answer;
  final List<PlacesModel> suggestions;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
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
                      height: 200,
                      child: ListView.builder(
                        itemCount: suggestions.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SuggestionCard(
                            imagePath: suggestions[index].imageUrl,
                            name: suggestions[index].name,
                            onTap: () {},
                          );
                        },
                      ),
                    ),
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
