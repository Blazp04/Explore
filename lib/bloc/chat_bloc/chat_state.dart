// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

enum ChatStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class ChatState {
  final List<SuggestionModel>? suggestionModel;
  final ChatStateStatus status;
  final List<String>? questions;

  final String? pastConversation;

  ChatState({
    this.suggestionModel,
    required this.status,
    this.questions,
    this.pastConversation,
  });

  ChatState copyWith({
    List<SuggestionModel>? suggestionModel,
    ChatStateStatus? status,
    List<String>? questions,
    String? pastConversation,
  }) {
    return ChatState(
      suggestionModel: suggestionModel ?? this.suggestionModel,
      status: status ?? this.status,
      questions: questions ?? this.questions,
      pastConversation: pastConversation ?? this.pastConversation,
    );
  }
}
