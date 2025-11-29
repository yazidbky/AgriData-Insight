import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/DI/dependency_injection.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/logo_widget.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/notification_card.dart';
import 'package:makers_hackathon/features/Notifications/Logic/alerts_cubit.dart';
import 'package:makers_hackathon/features/Notifications/Logic/alerts_state.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late AlertsCubit _alertsCubit;

  @override
  void initState() {
    super.initState();
    _alertsCubit = getIt<AlertsCubit>();
    _alertsCubit.getAlerts();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: SizeConfig.scalePadding(
                horizontal: 4,
                vertical: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LogoWidget(),
                  CustomText(
                    'NOTIFICATIONS',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  SizedBox(width: SizeConfig.scaleWidth(12)),
                ],
              ),
            ),
            // Alerts List
            Expanded(
              child: StreamBuilder<AlertsState>(
                stream: _alertsCubit.stream,
                initialData: _alertsCubit.state,
                builder: (context, snapshot) {
                  final state = snapshot.data;

                  if (state is AlertsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  if (state is AlertsFailure) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: SizeConfig.scaleText(48),
                            color: AppColors.error,
                          ),
                          SizedBox(height: SizeConfig.scaleHeight(2)),
                          CustomText(
                            state.failureMessage,
                            fontSize: 16,
                            color: AppColors.grey600,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: SizeConfig.scaleHeight(2)),
                          ElevatedButton(
                            onPressed: () => _alertsCubit.getAlerts(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            ),
                            child: CustomText(
                              'Retry',
                              fontSize: 14,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is AlertsSuccess) {
                    final alerts = state.alertsData.alerts;

                    if (alerts.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notifications_off_outlined,
                              size: SizeConfig.scaleText(48),
                              color: AppColors.grey400,
                            ),
                            SizedBox(height: SizeConfig.scaleHeight(2)),
                            CustomText(
                              'No notifications yet',
                              fontSize: 16,
                              color: AppColors.grey600,
                            ),
                          ],
                        ),
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () => _alertsCubit.getAlerts(),
                      color: AppColors.primary,
                      child: ListView.builder(
                        padding: SizeConfig.scalePadding(
                          horizontal: 4,
                          vertical: 0,
                        ),
                        itemCount: alerts.length,
                        itemBuilder: (context, index) {
                          final alert = alerts[index];
                          return NotificationCard(
                            iconAsset: alert.iconAsset,
                            title: alert.title,
                            subtitle: alert.description,
                          );
                        },
                      ),
                    );
                  }

                  // Initial state - show loading
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
