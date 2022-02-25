class Event {
  int? id;
  String? title;
  String? describtion;
  DateTime? expireDate;

  String? token;

  Event({this.id, this.title, this.describtion, this.expireDate});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    describtion = json['describtion'];
    expireDate = json['expireDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['describtion'] = describtion;
    data['expireData'] = expireDate;
    return data;
  }
}
