import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView(
        children: [NotificationComponent(noti: Notification(title: "매장 점검 안내", text: "7월 3일 매점 점검이 예정되어있습니다. 오후 5시부터 오후 7시 까지는 매점을 이용하실 수 없습니다.", date: DateTime.now(), highlighted: false)), NotificationComponent(noti: Notification(title: "매장 점검 안내", text: "7월 3일 매점 점검이 예정되어있습니다. 오후 5시부터 오후 7시 까지는 매점을 이용하실 수 없습니다.", date: DateTime.now(), highlighted: true)), NotificationComponent(noti: Notification(title: "매장 점검 안내", text: "7월 3일 매점 점검이 예정되어있습니다. 오후 5시부터 오후 7시 까지는 매점을 이용하실 수 없습니다.", date: DateTime.now(), highlighted: true)), NotificationComponent(noti: Notification(title: "매장 점검 안내", text: "7월 3일 매점 점검이 예정되어있습니다. 오후 5시부터 오후 7시 까지는 매점을 이용하실 수 없습니다.", date: DateTime.now(), highlighted: true)), NotificationComponent(noti: Notification(title: "매장 점검 안내", text: "7월 3일 매점 점검이 예정되어있습니다. 오후 5시부터 오후 7시 까지는 매점을 이용하실 수 없습니다.", date: DateTime.now(), highlighted: true)), NotificationComponent(noti: Notification(title: "매장 점검 안내", text: "7월 3일 매점 점검이 예정되어있습니다. 오후 5시부터 오후 7시 까지는 매점을 이용하실 수 없습니다.", date: DateTime.now(), highlighted: false)), NotificationComponent(noti: Notification(title: "매장 점검 안내", text: "7월 3일 매점 점검이 예정되어있습니다. 오후 5시부터 오후 7시 까지는 매점을 이용하실 수 없습니다.", date: DateTime.now(), highlighted: true)), NotificationComponent(noti: Notification(title: "매장 점검 안내", text: "7월 3일 매점 점검이 예정되어있습니다. 오후 5시부터 오후 7시 까지는 매점을 이용하실 수 없습니다.", date: DateTime.now(), highlighted: true)), NotificationComponent(noti: Notification(title: "매장 점검 안내", text: "7월 3일 매점 점검이 예정되어있습니다. 오후 5시부터 오후 7시 까지는 매점을 이용하실 수 없습니다.", date: DateTime.now(), highlighted: true)), NotificationComponent(noti: Notification(title: "매장 점검 안내", text: "7월 3일 매점 점검이 예정되어있습니다. 오후 5시부터 오후 7시 까지는 매점을 이용하실 수 없습니다.", date: DateTime.now(), highlighted: true))],
      ),
    );
  }
}

class NotificationComponent extends StatelessWidget {
  final Notification noti;
  const NotificationComponent({Key? key, required this.noti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: noti.highlighted ? const Color(0xfff0f4ff) : const Color(0xffffffff),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  noti.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text("3시간 전")
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(width: 250, child: Text(noti.text)) // ????
          ],
        ),
      ),
    );
  }
}

class Notification {
  String title;
  String text;
  DateTime date;
  bool highlighted;

  Notification({required this.title, required this.text, required this.date, required this.highlighted});
}
