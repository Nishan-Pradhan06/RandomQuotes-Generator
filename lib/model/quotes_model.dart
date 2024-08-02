import 'dart:convert';

QuotesModel quotesModelFromJson(String str) =>
    QuotesModel.fromJson(json.decode(str));

String quotesModelToJson(QuotesModel data) => json.encode(data.toJson());

class QuotesModel {
  final String id;
  final String content;
  final String author;
  final List<String> tags;

  QuotesModel({
    required this.id,
    required this.content,
    required this.author,
    required this.tags,
  });

  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
        id: json["_id"],
        content: json["content"],
        author: json["author"],
        tags: List<String>.from(
          json["tags"].map((x) => x),
        ),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "author": author,
        "tags": List<dynamic>.from(
          tags.map((x) => x),
        ),
      };
}
