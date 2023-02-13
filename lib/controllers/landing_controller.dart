import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stime_strack/core/theme/app_colors.dart';

class LandingPageController extends GetxController {
  static LandingPageController get instance => Get.find<LandingPageController>();

  final RxList<KanbanColumn> initialList = ([
    KanbanColumn('BACKLOG', [
      KanbanCard(
          title: 'This is your first task',
          priority: Priority.normal,
          limitDate: DateTime.now().add(const Duration(days: 1)),
          startDate: null,
          finishedDate: null)
    ]),
    KanbanColumn('TO DO', []),
    KanbanColumn('IN PROGRESS', []),
    KanbanColumn('DONE', []),
    KanbanColumn('HISTORY', []),
  ]).obs;
}



class KanbanColumn {
  String title;
  final List<KanbanCard> cards;
  bool? timeTrack;

  KanbanColumn(this.title, this.cards, {this.timeTrack});
}

enum Priority {
  low,
  normal,
  high;
}

class KanbanCard {
  String title;
  Priority priority;
  DateTime limitDate;
  DateTime? startDate, finishedDate;
  bool? startTrueFinishFalse;

  KanbanCard({required this.title, required this.priority, required this.limitDate, required this.startDate, required this.finishedDate});

  get priorityText => priority == Priority.low
      ? 'Low'
      : priority == Priority.normal
          ? 'Normal'
          : 'High';

  Color get priorityColor => priority == Priority.low
      ? AppColors.blueWarmVivid20
      : priority == Priority.normal
          ? Colors.green
          : AppColors.red700;


}

String getFormatedDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().padLeft(4, '0')}';
}
