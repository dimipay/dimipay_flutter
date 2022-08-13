import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/data/modules/transaction/controller.dart';
import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/pages/history/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HistoryPage extends GetView<HistoryPageController> {
  HistoryPage({Key? key}) : super(key: key);
  final TransactionController transactionController = Get.find<TransactionController>();

  Widget _buildTransactions(List<Transaction> transactions) {
    Map<DateTime, List<Transaction>> dailyTransactions = {};
    for (var transaction in transactions) {
      DateTime dt = DateTime(transaction.createdAt.year, transaction.createdAt.month, transaction.createdAt.day);
      if (dailyTransactions[dt] == null) {
        dailyTransactions[dt] = [];
      }
      dailyTransactions[dt]!.add(transaction);
    }

    List<TransactionGroup> children = [];
    for (var dailyTransaction in dailyTransactions.entries) {
      children.add(TransactionGroup(date: dailyTransaction.key, transactions: dailyTransaction.value));
    }
    children.sort((a, b) => a.date.compareTo(b.date));
    return Column(children: children);
  }

  Widget _couponArea() {
    return transactionController.obx(
      (state) {
        return _buildTransactions(state!);
      },
      onLoading: const CircularProgressIndicator(color: DPColors.MAIN_THEME),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('결제 기록')),
      body: SafeArea(
        child: RefreshIndicator(
          color: DPColors.MAIN_THEME,
          onRefresh: controller.refreshData,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        _couponArea(),
                        const SizedBox(height: 36),
                      ],
                    ),
                  ),
                ),
              ),
              // const TransactionCalendarViewer(),
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
  const TransactionGroup({Key? key, required this.date, required this.transactions}) : super(key: key);

  Widget _buildTransactions(List<Transaction> transactions) {
    List<Widget> childeren = [];
    transactions.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    for (var transaction in transactions) {
      childeren.add(const SizedBox(height: 18));
      childeren.add(TransactionWidget(transaction: transaction));
    }
    return Column(children: childeren);
  }

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
              style: const TextStyle(fontFamily: 'Pretendard', fontSize: 16, height: 1.2, color: DPColors.DARK1),
            ),
            Text(
              '$sum원',
              style: const TextStyle(fontFamily: 'Pretendard', fontSize: 16, height: 1.2, color: DPColors.DARK1),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(color: DPColors.DARK6),
        _buildTransactions(transactions),
        const SizedBox(height: 48),
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
              const Text(
                "transaction.title",
                style: DPTextTheme.REGULAR,
              ),
              const SizedBox(height: 4),
              Text(
                '${transaction.createdAt.hour}시 ${transaction.createdAt.minute}분',
                style: DPTextTheme.DESCRIPTION,
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
