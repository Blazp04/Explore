import 'package:explore/_all.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({
    super.key,
    required this.onSubmitted,
    required this.onChanged,
  });
  void Function(String) onChanged;
  void Function(String) onSubmitted;
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
            prefixIcon: GestureDetector(
                onTap: () {
                  context.pushNamed(HomePage.routeName);
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            hintText: 'Što danas tražimo',
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) => onChanged(value),
          onSubmitted: (value) => onSubmitted(value),
        ),
      ),
    );
  }
}
