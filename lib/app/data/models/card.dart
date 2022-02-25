class Card {
  int? id;
  String? title;
  String? subtitle;
  String? color;

  String? token;

  Card({this.id, this.title, this.subtitle, this.color});

  Card.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['expireData'] = color;
    return data;
  }
}
