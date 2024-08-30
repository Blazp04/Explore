part of 'prompt_suggestion_bloc.dart';

@immutable
sealed class PromptSuggestionState {}

final class PromptSuggestionInitialState extends PromptSuggestionState {}

final class PromptSuggestionLoadingState extends PromptSuggestionState {}

final class PromptSuggestionLoadedState extends PromptSuggestionState {
  final List<PromptSuggestionModel> promptSuggestions;

  PromptSuggestionLoadedState({required this.promptSuggestions});
}

final class PromptSuggestionErrorState extends PromptSuggestionState {
  final String error;

  PromptSuggestionErrorState({required this.error});
}
