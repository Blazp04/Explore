// import 'dart:convert';

// // ignore_for_file: public_member_api_docs, sort_constructors_first

// class QuestionModel {
//   final String answer;

//   QuestionModel({
//     required this.answer,
//   });

//   factory QuestionModel.fromMap(Map<String, dynamic> map) {
//     return QuestionModel(
//       answer: map['questions'] as String,
//     );
//   }

//   QuestionModel copyWith({
//     String? questions,
//   }) {
//     return QuestionModel(
//       answer: questions ?? this.answer,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'questions': answer,
//     };
//   }

//   String toJson() => json.encode(toMap());

//   factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'QuestionModel(questions: $answer)';

//   @override
//   bool operator ==(covariant QuestionModel other) {
//     if (identical(this, other)) return true;

//     return other.answer == answer;
//   }

//   @override
//   int get hashCode => answer.hashCode;
// }
