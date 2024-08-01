

class QuotesModel {
  String? sId;
  String? content;
  String? author;
  List<String>? tags;

  QuotesModel(
      {this.sId,
      this.content,
      this.author,
      this.tags,
});

  QuotesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    author = json['author'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['content'] = content;
    data['author'] = author;
    data['tags'] = tags;
    return data;
  }
}
