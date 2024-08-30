part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

final class GetSuggestionsEvent extends ChatEvent {
  final String question;

  GetSuggestionsEvent({
    required this.question,
  });
}
