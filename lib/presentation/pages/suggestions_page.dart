import 'package:explore/_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class SuggestionChatCard extends StatelessWidget {
  const SuggestionChatCard({
    required this.question,
    required this.answer,
    super.key,
  });

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 410,
      width: context.screenWidth,
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
          Container(
            padding: const EdgeInsets.all(20),
            width: context.screenWidth - 30,
            height: 320,
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
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Suggestioncard(
                        imagePath: 'assets/images/stariMost.jpeg',
                        name: 'Stari Most',
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Suggestioncard extends StatelessWidget {
  const Suggestioncard({
    required this.imagePath,
    required this.name,
    required this.onTap,
    super.key,
  });

  final String imagePath;
  final String name;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          width: 270,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3C3B42).withOpacity(0.25),
                blurRadius: 2.5,
                spreadRadius: 0,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140,
                width: 270,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  color: Colors.greenAccent,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                ),
                child: Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.titleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
