import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/data/models/transaction.dart';
import 'package:dimipay/app/modules/transaction_history/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TransactionHistoryPage extends GetView<TransactionController> {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('결제 기록')),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.refreshData,
          child: Column(
            children: [
              Expanded(
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
                              controller.obx(
                                  (state) => Column(
                                          children: controller.transaction.value.map((model) {
                                        final products = model.products;
                                        List<String> names = products.map((model) => model.name).toList();
                                        return TransactionWidget(transaction: model);
                                      }).toList()),
                                  onLoading: CircularProgressIndicator()),
                              const SizedBox(height: 36),
                              const Text(
                                '3월 결제 기록 보기',
                                style: TextStyle(color: DPColors.MAIN_THEME, decoration: TextDecoration.underline),
                              ),
                              const SizedBox(height: 36),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const TransactionCalendarViewer(),
            ],
          ),
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
      sum += transaction.totalPrice;
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
              //transactions.sort((a, b) => a.date.compareTo(b.date));
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
    DateTime datetime = DateTime.parse("${transaction.createdAt}");

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "transaction.title",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                '${datetime.hour}시 ${datetime.minute}분',
                style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
              ),
            ],
          ),
        ),
        const SizedBox(width: 53),
        Text(
          '${transaction.totalPrice}원',
          style: const TextStyle(fontSize: 16, color: DPColors.MAIN_THEME, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class TransactionCalendarViewer extends StatelessWidget {
  const TransactionCalendarViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFFD8D8D8)))),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset('asset/images/arrow_left_6.svg'),
              const SizedBox(width: 10),
              const Text(
                '2021년',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 4),
              const Text(
                '4월',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 10),
              SvgPicture.asset('asset/images/arrow_right.svg'),
            ],
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Row(
              children: [
                TransactionCalendarViewerDateItem(date: DateTime(2021, 12, 19)),
                const SizedBox(width: 8),
                TransactionCalendarViewerDateItem(date: DateTime(2021, 12, 20), isHighlighted: true),
                const SizedBox(width: 8),
                TransactionCalendarViewerDateItem(date: DateTime(2021, 12, 21), isHighlighted: true),
                const SizedBox(width: 8),
                TransactionCalendarViewerDateItem(date: DateTime(2021, 12, 22)),
                const SizedBox(width: 8),
                TransactionCalendarViewerDateItem(date: DateTime(2021, 12, 23), isHighlighted: true),
                const SizedBox(width: 8),
                TransactionCalendarViewerDateItem(date: DateTime(2021, 12, 24)),
                const SizedBox(width: 8),
                TransactionCalendarViewerDateItem(date: DateTime(2021, 12, 25), isHighlighted: true),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TransactionCalendarViewerDateItem extends StatelessWidget {
  final DateTime date;
  final bool isHighlighted;
  final weekdays = ['', '월', '화', '수', '목', '금', '토', '일'];
  TransactionCalendarViewerDateItem({Key? key, required this.date, this.isHighlighted = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Text(weekdays[date.weekday], style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4))),
          const SizedBox(height: 6),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isHighlighted ? DPColors.MAIN_THEME : const Color(0xFFF9F9F9),
              ),
              child: Center(
                child: Text(
                  date.day.toString(),
                  style: TextStyle(color: isHighlighted ? Colors.white : Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
