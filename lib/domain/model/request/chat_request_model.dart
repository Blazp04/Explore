// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatRequestModel {
  final String prompt;
  ChatRequestModel({
    required this.prompt,
  });

  ChatRequestModel copyWith({
    String? prompt,
  }) {
    return ChatRequestModel(
      prompt: prompt ?? this.prompt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'prompt': prompt,
    };
  }

  factory ChatRequestModel.fromMap(Map<String, dynamic> map) {
    return ChatRequestModel(
      prompt: map['prompt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatRequestModel.fromJson(String source) => ChatRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'chatModel(prompt: $prompt)';

  @override
  bool operator ==(covariant ChatRequestModel other) {
    if (identical(this, other)) return true;

    return other.prompt == prompt;
  }

  @override
  int get hashCode => prompt.hashCode;
}
