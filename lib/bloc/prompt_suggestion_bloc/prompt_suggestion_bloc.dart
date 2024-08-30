import 'package:explore/_all.dart';

part 'prompt_suggestion_event.dart';
part 'prompt_suggestion_state.dart';

class PromptSuggestionBloc extends Bloc<PromptSuggestionEvent, PromptSuggestionState> {
  final IPromptSuggestionRepository promptSuggestionRepository;
  PromptSuggestionBloc({
    required this.promptSuggestionRepository,
  }) : super(PromptSuggestionInitialState()) {
    on<PromptSuggestionLoadEvent>(getPromptSuggestions);
  }

  Future getPromptSuggestions(PromptSuggestionLoadEvent event, Emitter<PromptSuggestionState> emit) async {
    emit(PromptSuggestionLoadingState());
    try {
      final promptSuggestions = await promptSuggestionRepository.getPromptSuggestions();
      emit(PromptSuggestionLoadedState(promptSuggestions: promptSuggestions));
    } catch (e) {
      emit(PromptSuggestionErrorState(error: e.toString()));
    }
  }
}
