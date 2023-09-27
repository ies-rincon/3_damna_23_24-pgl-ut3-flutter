import 'package:yes_no_maybe_app/domain/entities/messages.dart';

/// Modelo de YesNo Model - Manual
// class YesNoModel {
//   String answer;
//   bool forced;
//   String image;

//   YesNoModel({
//     required this.answer,
//     required this.forced,
//     required this.image,
//   });

//   factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
//         answer: json['answer'],
//         forced: json['forced'],
//         image: json['image'],
//       );
// }

/// Modelo de YesNo Model - https://app.quicktype.io/
// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
        text: answer == 'yes' ? 'Si 💕' : 'No 😡',
        fromWho: FromWho.hers,
        imageUrl: image,
      );
}
