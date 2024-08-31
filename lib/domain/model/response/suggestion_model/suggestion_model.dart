// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

import 'package:explore/_all.dart';

class SuggestionModel {
  final String text;
  final String actionType;
  final List<PlacesModel> placesModel;

  SuggestionModel({
    required this.text,
    required this.actionType,
    required this.placesModel,
  });

  SuggestionModel copyWith({
    String? text,
    List<PlacesModel>? placesModel,
    String? actionType,
  }) {
    return SuggestionModel(
      actionType: actionType ?? this.actionType,
      text: text ?? this.text,
      placesModel: placesModel ?? this.placesModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'actionType': actionType,
      'text': text,
      'placesModel': placesModel.map((x) => x.toMap()).toList(),
    };
  }

  factory SuggestionModel.fromMap(Map<String, dynamic> map) {
    return SuggestionModel(
      actionType: map['action_type'] as String,
      text: map['text'] as String,
      placesModel: List<PlacesModel>.from(
        (map['places']).map<PlacesModel>(
          (x) => PlacesModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SuggestionModel.fromJson(String source) => SuggestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SuggestionModel(text: $text, placesModel: $placesModel)';

  @override
  bool operator ==(covariant SuggestionModel other) {
    if (identical(this, other)) return true;

    return other.text == text && listEquals(other.placesModel, placesModel);
  }

  @override
  int get hashCode => text.hashCode ^ placesModel.hashCode;
}
