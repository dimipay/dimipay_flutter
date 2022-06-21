import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/data/modules/event/controller.dart';
import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/pages/event/widget/event_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventPage extends StatelessWidget {
  EventPage({Key? key}) : super(key: key);
  final eventsController = Get.find<EventController>();

  Widget _buildEvents(List<Event> events) {
    return Column(
      children: events
          .map(
            (event) => Column(
              children: [
                EventItem(title: event.title, description: event.description, expireDate: event.endsAt),
                const SizedBox(height: 36),
              ],
            ),
          )
          .toList(),
    );
  }

  Widget _events() {
    return eventsController.obx(
      (events) => _buildEvents(events!),
      onLoading: const CircularProgressIndicator(color: DPColors.MAIN_THEME),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('이벤트')),
      body: RefreshIndicator(
        color: DPColors.MAIN_THEME,
        onRefresh: eventsController.refreshEvents,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
              children: [
                _events(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
