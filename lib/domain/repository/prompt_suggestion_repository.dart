import 'package:explore/_all.dart';

abstract class IPromptSuggestionRepository {
  Future<List<PromptSuggestionModel>> getPromptSuggestions();
}

class PromptSuggestionRepository implements IPromptSuggestionRepository {
  // final api = services.get<DioConfiguration>();
  @override
  Future<List<PromptSuggestionModel>> getPromptSuggestions() async {
    await Future.delayed(const Duration(seconds: 3));
    return [
      PromptSuggestionModel(
        title: "Prijedlog",
        subtitle: "Što danas ima u Mostaru",
      ),
      PromptSuggestionModel(
        title: "Prijedlog",
        subtitle: "Ima li večeras ijedan koncert u Mostaru",
      ),
      PromptSuggestionModel(
        title: "Prijedlog",
        subtitle: "Gdje mogu otići da svira glazba uživo",
      ),
      PromptSuggestionModel(
        title: "Prijedlog",
        subtitle: "Šta sve mogu posjetiti u Mostaru",
      ),
    ];
  }
}
