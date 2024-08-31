// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatRequestModel {
  final String prompt;
  final String? chatHistory;
  ChatRequestModel({
    required this.prompt,
    this.chatHistory,
  });

  ChatRequestModel copyWith({
    String? prompt,
    String? chatHistory,
  }) {
    return ChatRequestModel(
      prompt: prompt ?? this.prompt,
      chatHistory: chatHistory ?? this.chatHistory,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'prompt': prompt,
      'chatHistory': chatHistory,
    };
  }

  factory ChatRequestModel.fromMap(Map<String, dynamic> map) {
    return ChatRequestModel(
      prompt: map['prompt'] as String,
      chatHistory: map['chatHistory'] != null ? map['chatHistory'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatRequestModel.fromJson(String source) => ChatRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChatRequestModel(prompt: $prompt, chatHistory: $chatHistory)';

  @override
  bool operator ==(covariant ChatRequestModel other) {
    if (identical(this, other)) return true;

    return other.prompt == prompt && other.chatHistory == chatHistory;
  }

  @override
  int get hashCode => prompt.hashCode ^ chatHistory.hashCode;
}
