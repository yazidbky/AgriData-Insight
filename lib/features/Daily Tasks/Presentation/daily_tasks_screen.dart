import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Daily%20Tasks/Presentation/widgets/daily_task_card.dart';
import 'package:makers_hackathon/features/Daily%20Tasks/Presentation/widgets/daily_tasks_header.dart';
import 'package:makers_hackathon/features/Daily%20Tasks/Presentation/widgets/daily_tasks_list.dart';

class DailyTasksScreen extends StatelessWidget {
  const DailyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    // Sample tasks data - can be replaced with API data
    final List<DailyTaskData> tasks = [
      const DailyTaskData(
        title: 'Avoid spraying today',
        subtitle: 'high wind advisory',
        taskType: TaskType.warning,
      ),
      const DailyTaskData(
        title: 'water the field today',
        subtitle: 'Irrigate sector 3 of 20 min',
        taskType: TaskType.irrigation,
      ),
      const DailyTaskData(
        title: 'Add Nitrogen fertilizer(N)',
        subtitle: 'Apply to corn field,Sector1',
        taskType: TaskType.fertilizer,
      ),
      const DailyTaskData(
        title: 'Avoid spraying today',
        subtitle: 'high wind advisory',
        taskType: TaskType.warning,
      ),
      const DailyTaskData(
        title: 'Add Nitrogen fertilizer(N)',
        subtitle: 'Apply to corn field,Sector1',
        taskType: TaskType.fertilizer,
      ),
      const DailyTaskData(
        title: 'water the field today',
        subtitle: 'Irrigate sector 3 of 20 min',
        taskType: TaskType.irrigation,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.scaleHeight(2)),
            // Header with logo and title
            const DailyTasksHeader(),
            SizedBox(height: SizeConfig.scaleHeight(3)),
            // Tasks list
            Expanded(
              child: SingleChildScrollView(
                child: DailyTasksList(tasks: tasks),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

