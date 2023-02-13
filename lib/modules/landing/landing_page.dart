import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stime_strack/controllers/landing_controller.dart';
import 'package:stime_strack/core/theme/app_colors.dart';
import 'package:stime_strack/global_widgets/left_drawer/left_drawer.dart';

import '../../global_widgets/edit_text_field.dart';

class LandingPage extends GetView<LandingPageController> {
  static const ROUTE = '/landing';

  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final controllerRow = ScrollController();

    return SafeArea(
        child: Scaffold(
            drawer: const LeftDrawer(),
            appBar: AppBar(elevation: 0, title: const Text("Board")),
            backgroundColor: AppColors.blueWarmVivid70,
            body: Obx(
              () => Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  controller: controllerRow,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: List.generate(
                        controller.initialList.length,
                        (columnIndex) {
                          final scrollController = ScrollController();
                          final kanbanColumn = controller.initialList[columnIndex];
                          return Padding(
                            padding: columnIndex == 0 ? EdgeInsets.zero : const EdgeInsets.only(left: 10),
                            child: Container(
                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: Colors.white),
                              width: width * 0.7,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: EditTextKanban(
                                          title: kanbanColumn.title,
                                          onChangeTitle: (title) {
                                            controller.initialList[columnIndex].title = title;
                                            FocusManager.instance.primaryFocus?.unfocus();
                                          },
                                          bgColor: Colors.blue[100],
                                        )),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                final shouldDelete = await _showMyDialog(context, kanbanColumn.title);
                                                if (shouldDelete == true) {
                                                  controller.initialList.removeAt(columnIndex);
                                                  controller.initialList.refresh();
                                                }
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: AppColors.blackMediumEmphashis,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                kanbanColumn.cards.add(KanbanCard(
                                                    title: 'Card ${kanbanColumn.cards.length + 1}',
                                                    priority: Priority.normal,
                                                    limitDate: DateTime.now().add(const Duration(days: 1)),
                                                    startDate: kanbanColumn.timeTrack != null ? DateTime.now() : null,
                                                    finishedDate: kanbanColumn.timeTrack == false ? DateTime.now() : null));
                                                scrollController.animateTo(scrollController.position.maxScrollExtent,
                                                    duration: const Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
                                                controller.initialList.refresh();
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: AppColors.blackMediumEmphashis,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView(
                                      key: Key(columnIndex.toString()),
                                      controller: scrollController,
                                      children: List.generate(kanbanColumn.cards.length, (cardIndex) {
                                        final card = kanbanColumn.cards[cardIndex];
                                        return Padding(
                                          padding: const EdgeInsets.all(2.5),
                                          child: Card(
                                            child: Container(
                                              color: Colors.grey[300],
                                              child: Padding(
                                                padding: const EdgeInsets.all(5),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                      Expanded(
                                                          child: EditTextKanban(
                                                        title: card.title,
                                                        onChangeTitle: (title) {
                                                          controller.initialList[columnIndex].cards[cardIndex].title = title;
                                                        },
                                                        textStyle: const TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 15,
                                                        ),
                                                        bgColor: Colors.blue[100],
                                                      )),
                                                      InkWell(
                                                        onTap: () async {
                                                          final shouldDelete = await _showMyDialog(context, card.title, type: 'card');
                                                          if (shouldDelete == true) {
                                                            controller.initialList[columnIndex].cards.removeAt(cardIndex);
                                                            controller.initialList.refresh();
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons.delete,
                                                          size: 20,
                                                          color: AppColors.blackMediumEmphashis,
                                                        ),
                                                      )
                                                    ]),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Flexible(child: Text('Priority: ${card.priorityText}')),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          height: 15,
                                                          width: 15,
                                                          color: card.priorityColor,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text('Due date: ${getFormatedDate(card.limitDate)}'),
                                                    if (card.startDate != null)
                                                      Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text('Started date: ${getFormatedDate(card.startDate!)}'),
                                                        ],
                                                      ),
                                                    if (kanbanColumn.timeTrack == true)
                                                      Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text('Finished date: ${getFormatedDate(card.finishedDate!)}'),
                                                        ],
                                                      ),
                                                    const SizedBox(height: 12),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: Container(
                                                                decoration: const BoxDecoration(
                                                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                  color: AppColors.blueWarmVivid20,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () {
                                                                    if (kanbanColumn.timeTrack == true) {
                                                                      kanbanColumn.timeTrack == null;
                                                                    } else {
                                                                      kanbanColumn.timeTrack == true;
                                                                    }
                                                                  },
                                                                  child: const Center(child: Text('Start task')),
                                                                ))),
                                                        const SizedBox(width: 8),
                                                        Expanded(
                                                            child: Container(
                                                                decoration: const BoxDecoration(
                                                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                  color: AppColors.lightYellow,
                                                                ),
                                                                child: GestureDetector(
                                                                  onTap: () {
                                                                    if (kanbanColumn.timeTrack == false) {
                                                                      kanbanColumn.timeTrack == null;
                                                                    } else {
                                                                      kanbanColumn.timeTrack == false;
                                                                    }
                                                                  },
                                                                  child: const Center(child: Text('Finish task')),
                                                                ))),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.initialList.add(KanbanColumn('Column ${controller.initialList.length + 1}', []));
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}

Future<bool?> _showMyDialog(BuildContext context, String title, {String type = 'column'}) async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete $type\n"$title"?', style: Get.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400, letterSpacing: 0.15)),
        actions: <Widget>[
          TextButton(
            child: const Text('YES'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          TextButton(
            child: const Text('NO'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      );
    },
  );
}
