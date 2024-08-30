import 'package:explore/_all.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController bubbleChatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ExploreScaffold(
      child: Column(
        children: [
          Gap(30),
          AccountCard(
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
              itemBuilder: (context, index) => SuggestionCard(
                onTap: () {},
                title: 'Prijedlog',
                subTitle: 'Šta ima za vidit u Mostaru',
              ),
            ),
          ),
          Gap(15),
          ChatBubble(
            onChanged: (p0) => bubbleChatController.text = p0,
          ),
          Gap(30),
        ],
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  const AccountCard({
    required this.imagePath,
    required this.name,
    required this.subtitle,
    super.key,
  });

  final String imagePath;
  final String name;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF3C3B42).withOpacity(0.25),
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Gap(15),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pozdrav, $name',
                  style: TextStyle(
                    color: AppColors.titleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({
    required this.onTap,
    required this.title,
    required this.subTitle,
    super.key,
  });

  final void Function() onTap;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding: EdgeInsets.all(8),
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFF3C3B42).withOpacity(0.25),
                blurRadius: 4,
                spreadRadius: 0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.titleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  ChatBubble({
    super.key,
    required this.onChanged,
  });
  void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.delete, color: Colors.red),
            hintText: 'Što danas tražimo',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) => onChanged(value),
        ),
      ),
    );
  }
}
