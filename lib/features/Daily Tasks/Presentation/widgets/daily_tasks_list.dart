import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Daily%20Tasks/Presentation/widgets/daily_task_card.dart';

class DailyTasksList extends StatelessWidget {
  final List<DailyTaskData> tasks;

  const DailyTasksList({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Padding(
      padding: SizeConfig.scalePadding(horizontal: 4),
      child: Column(
        children: tasks.map((task) {
          return DailyTaskCard(
            title: task.title,
            subtitle: task.subtitle,
            taskType: task.taskType,
            onTap: task.onTap,
          );
        }).toList(),
      ),
    );
  }
}

/// Data model for daily tasks
class DailyTaskData {
  final String title;
  final String subtitle;
  final TaskType taskType;
  final VoidCallback? onTap;

  const DailyTaskData({
    required this.title,
    required this.subtitle,
    required this.taskType,
    this.onTap,
  });
}

