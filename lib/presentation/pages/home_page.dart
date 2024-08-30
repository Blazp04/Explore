import 'package:explore/_all.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController bubbleChatController = TextEditingController();

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
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => PromptSuggestionCard(
                onTap: () {},
                title: 'Prijedlog',
                subTitle: 'Šta ima za vidit u Mostaru',
              ),
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
