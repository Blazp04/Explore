import 'package:explore/_all.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final IChatRepository chatRepository;
  ChatBloc({
    required this.chatRepository,
  }) : super(ChatState(status: ChatStateStatus.initial)) {
    on<GetSuggestionsEvent>(getSuggestions);
    on<AnswerToSuggestedtQuestionEvent>(answerToSuggestedQuestion);
  }

  Future getSuggestions(GetSuggestionsEvent event, Emitter emit) async {
    emit(ChatState(status: ChatStateStatus.loading));
    try {
      final ChatRequestModel requestmodel = ChatRequestModel(
        prompt: event.question,
      );
      final suggestionModel = await chatRepository.getChatSuggestions(model: requestmodel);
      List<SuggestionModel> model = [suggestionModel];
      if (state.suggestionModel != null) {
        model = [...state.suggestionModel!, suggestionModel];
      }
      emit(ChatState(suggestionModel: model, status: ChatStateStatus.loaded, questions: [
        ...state.questions ?? [],
        event.question,
      ]));
    } catch (e) {
      emit(ChatState(status: ChatStateStatus.error));
    }
  }

  Future answerToSuggestedQuestion(AnswerToSuggestedtQuestionEvent event, Emitter emit) async {
    emit(ChatState(status: ChatStateStatus.loading));
    final String conversation = event.model.toString();

    try {
      final ChatRequestModel requestmodel = ChatRequestModel(
        prompt: event.model.userQuestion,
        chatHistory: (state.pastConversation ?? '') + conversation,
      );
      final suggestionModel = await chatRepository.getChatSuggestions(model: requestmodel);
      List<SuggestionModel> model = [suggestionModel];
      if (state.suggestionModel != null) {
        model = [...state.suggestionModel!, suggestionModel];
      }
      emit(ChatState(suggestionModel: model, status: ChatStateStatus.loaded, questions: [
        event.model.userAnswer,
      ]));
    } catch (e) {
      emit(ChatState(status: ChatStateStatus.error));
    }
  }
}
