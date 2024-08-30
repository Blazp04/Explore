import 'package:explore/_all.dart';

abstract class IChatRepository {
  Future<SuggestionModel> getChatSuggestions();
}

class ChatRepository implements IChatRepository {
  final api = services.get<DioConfiguration>();

  @override
  Future<SuggestionModel> getChatSuggestions() async {
    await Future.delayed(const Duration(seconds: 2));
    return SuggestionModel(
      text: 'Danas u mostaru nema ništa',
      placesModel: [
        PlacesModel(
          name: 'Stari Mostar',
          imageUrl: 'assets/images/stariMost.jpeg',
          description: 'description',
          url: 'url',
        ),
      ],
    );
  }
}
