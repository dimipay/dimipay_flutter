import 'package:dimipay/app/ui/ui_asset.dart';
import 'package:flutter/material.dart';

class Transaction {
  String title;
  DateTime date;
  int price;
  Transaction(this.title, this.date, this.price);
}

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('결제 기록')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      TransactionGroup(
                        date: DateTime(2021, 12, 22, 11, 22),
                        transactions: [
                          Transaction('돼지바 까만색, 돼지바 빨간색', DateTime(2021, 12, 22, 11, 22), 500),
                          Transaction('돼지바 까만색, 돼지바 빨간색', DateTime(2021, 12, 22, 11, 22), 500),
                        ],
                      ),
                      const SizedBox(height: 36),
                      TransactionGroup(
                        date: DateTime(2021, 12, 22, 11, 22),
                        transactions: [
                          Transaction('돼지바 까만색, 돼지바 빨간색', DateTime(2021, 12, 22, 11, 22), 500),
                          Transaction('돼지바 까만색, 돼지바 빨간색', DateTime(2021, 12, 22, 11, 22), 500),
                          Transaction('돼지바 까만색, 돼지바 빨간색', DateTime(2021, 12, 22, 11, 22), 500),
                        ],
                      ),
                      const SizedBox(height: 36),
                      const Text(
                        '3월 결제 기록 보기',
                        style: TextStyle(color: mainColor, decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TransactionGroup extends StatelessWidget {
  final DateTime date;
  final List<Transaction> transactions;
  const TransactionGroup({Key? key, required this.date, this.transactions = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int sum = 0;
    for (var transaction in transactions) {
      sum += transaction.price;
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${date.month}월 ${date.day}일',
              style: const TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.4)),
            ),
            Text(
              '$sum원',
              style: const TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.4)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(color: Color.fromRGBO(0, 0, 0, 0.4)),
        Builder(
          builder: (context) {
            List<Widget> childeren = [];
            if (transactions.isNotEmpty) {
              transactions.sort((a, b) => a.date.compareTo(b.date));
              for (var transaction in transactions) {
                childeren.add(const SizedBox(height: 24));
                childeren.add(TransactionWidget(transaction: transaction));
              }
            }
            return Column(children: childeren);
          },
        ),
      ],
    );
  }
}

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;
  const TransactionWidget({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                '${transaction.date.hour}시 ${transaction.date.minute}분',
                style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
              ),
            ],
          ),
        ),
        const SizedBox(width: 53),
        Text(
          '${transaction.price}원',
          style: const TextStyle(fontSize: 16, color: mainColor, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
