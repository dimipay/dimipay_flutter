class Notice {
  int? id;
  String? title;
  String? content;

  String? token;

  Notice({this.id, this.title, this.content});

  Notice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    return data;
  }
}
