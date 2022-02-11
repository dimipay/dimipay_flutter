import 'package:flutter/material.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Profile(),
        ],
      )),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          //backgroundImage: AssetImage("asset/images/Image11.png"),
          backgroundImage: NetworkImage("https://flyclipart.com/thumb2/boss-circle-man-person-profile-staff-user-icon-133441.png"),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("장인화", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            SizedBox(height: 4),
          ],
        ),
      ],
    );
  }
}

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//개월마다 날짜가 내림차순으로 정렬된 상태로 파라미터가 온다고 할 때
class TransactionGroup extends StatelessWidget {
  final List<Transaction> tranactions;
  const TransactionGroup({Key? key, this.tranactions = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<Transaction>> temp = [];
    List<int> day = [];

    int last = tranactions[0].date.day;
    temp.add([tranactions[0]]);
    day.add(tranactions[0].date.day);

    for (int i = 1; i < tranactions.length; i++) {}
    return Container();
  }
}

class Transaction {
  String title;
  DateTime date;
  int price;
  Transaction(this.title, this.date, this.price);
}
