// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

import 'package:explore/_all.dart';

class SuggestionModel {
  final String text;
  final String actionType;
  final List<PlacesModel>? placesModel;
  final List<String>? answers;

  SuggestionModel({
    required this.text,
    required this.actionType,
    required this.placesModel,
    required this.answers,
  });

  SuggestionModel copyWith({
    String? text,
    String? actionType,
    List<PlacesModel>? placesModel,
    List<String>? answers,
  }) {
    return SuggestionModel(
      text: text ?? this.text,
      actionType: actionType ?? this.actionType,
      placesModel: placesModel ?? this.placesModel,
      answers: answers ?? this.answers,
    );
  }

  factory SuggestionModel.fromMap(Map<String, dynamic> map) {
    return SuggestionModel(
      text: map['text'] as String,
      actionType: map['action_type'] as String,
      answers: (map['answers'] as List<dynamic>?)?.cast<String>(),
      placesModel: map['places'] != null
          ? List<PlacesModel>.from(
              (map['places']).map<PlacesModel?>(
                (x) => PlacesModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  factory SuggestionModel.fromJson(String source) => SuggestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SuggestionModel(text: $text, actionType: $actionType, placesModel: $placesModel)';

  @override
  bool operator ==(covariant SuggestionModel other) {
    if (identical(this, other)) return true;

    return other.text == text && other.actionType == actionType && listEquals(other.placesModel, placesModel);
  }

  @override
  int get hashCode => text.hashCode ^ actionType.hashCode ^ placesModel.hashCode;
}
