// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatHistoryRequestmodel {
  String userQuestion;
  String textFromGPT;
  String userAnswer;
  ChatHistoryRequestmodel({
    required this.userQuestion,
    required this.textFromGPT,
    required this.userAnswer,
  });

  ChatHistoryRequestmodel copyWith({
    String? userQuestion,
    String? textFromGPT,
    String? userAnswer,
  }) {
    return ChatHistoryRequestmodel(
      userQuestion: userQuestion ?? this.userQuestion,
      textFromGPT: textFromGPT ?? this.textFromGPT,
      userAnswer: userAnswer ?? this.userAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userQuestion': userQuestion,
      'textFromGPT': textFromGPT,
      'userAnswer': userAnswer,
    };
  }

  factory ChatHistoryRequestmodel.fromMap(Map<String, dynamic> map) {
    return ChatHistoryRequestmodel(
      userQuestion: map['userQuestion'] as String,
      textFromGPT: map['textFromGPT'] as String,
      userAnswer: map['userAnswer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatHistoryRequestmodel.fromJson(String source) => ChatHistoryRequestmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChatHistoryRequestmodel(userQuestion: $userQuestion, textFromGPT: $textFromGPT, userAnswer: $userAnswer)';

  @override
  bool operator ==(covariant ChatHistoryRequestmodel other) {
    if (identical(this, other)) return true;

    return other.userQuestion == userQuestion && other.textFromGPT == textFromGPT && other.userAnswer == userAnswer;
  }

  @override
  int get hashCode => userQuestion.hashCode ^ textFromGPT.hashCode ^ userAnswer.hashCode;
}
