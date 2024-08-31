import 'package:explore/_all.dart';
import 'package:http/http.dart' as http;

abstract class IChatRepository {
  Future<SuggestionModel> getChatSuggestions({required ChatRequestModel model});
}

class ChatRepository implements IChatRepository {
  // final api = services.get<DioConfiguration>();

  @override
  Future<SuggestionModel> getChatSuggestions({required ChatRequestModel model}) async {
    try {
      final response = await http.post(
        Uri.parse('https://67a1-85-94-155-170.ngrok-free.app/ask'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: model.toJson(),
      );
      final data = jsonDecode(response.body);
      final result = SuggestionModel.fromMap(data['message']['result']);
      return result;
    } catch (e) {
      rethrow;
    }

    // await Future.delayed(const Duration(seconds: 2));
    // return SuggestionModel(
    //   text: 'Danas u mostaru nema ništa',
    //   placesModel: [
    //     PlacesModel(
    //       name: 'Stari Mostar',
    //       imageUrl: 'assets/images/stariMost.jpeg',
    //       description: 'description',
    //       url: 'url',
    //       type: 'place',
    //     ),
    //   ],
    // );
  }
}
