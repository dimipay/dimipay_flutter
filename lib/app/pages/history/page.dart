import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/data/services/transaction/model.dart';
import 'package:dimipay/app/pages/history/controller.dart';
import 'package:dimipay/app/widgets/appbar.dart';
import 'package:dimipay/app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends GetView<HistoryPageController> {
  const HistoryPage({Key? key}) : super(key: key);

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
    children.sort((a, b) => b.date.compareTo(a.date));
    return Column(children: children);
  }

  Widget _transactionArea() {
    return controller.transactionController.obx(
      (state) {
        return _buildTransactions(state!);
      },
      onLoading: const DPLoading(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DPAppBar(title: '결제 기록'),
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          color: DPColors.MAIN_THEME,
          onRefresh: controller.refreshData,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        const SizedBox(height: 36, width: double.infinity),
                        _transactionArea(),
                        const SizedBox(height: 36),
                      ],
                    ),
                  ),
                ),
              ),
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
              style: DPTextTheme.REGULAR_IMPORTANT,
            ),
            Text(
              '총 $sum원',
              style: DPTextTheme.REGULAR_IMPORTANT,
            ),
          ],
        ),
        const SizedBox(height: 12),
        const SizedBox(
          width: double.infinity,
          child: Divider(color: DPColors.DARK6, thickness: 1.0),
        ),
        _buildTransactions(transactions),
        const SizedBox(height: 48),
      ],
    );
  }
}

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;
  const TransactionWidget({Key? key, required this.transaction}) : super(key: key);

  String getTransactionTitle() {
    return transaction.products.map((e) => e.name).join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTransactionTitle(),
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
      ),
    );
  }
}
