import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/constants/app_assets.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/build_icon.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/status_card.dart';

class SoilStatusCard extends StatelessWidget {
  final String status;
  final int? healthScore;
  final bool isLoading;

  const SoilStatusCard({
    super.key,
    this.status = 'Good',
    this.healthScore,
    this.isLoading = false,
  });

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'good':
        return AppColors.primary;
      case 'needs attention':
      case 'warning':
        return Colors.orange;
      case 'critical':
      case 'bad':
        return AppColors.error;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    
    if (isLoading) {
      return Container(
        width: SizeConfig.scaleWidth(42),
        height: SizeConfig.scaleHeight(15),
        padding: SizeConfig.allPadding(4),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(232, 245, 233, 1),
          borderRadius: BorderRadius.circular(SizeConfig.scaleRadius(3)),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
            strokeWidth: 2,
          ),
        ),
      );
    }

    return StatusCard(
      cardColor: const Color.fromRGBO(232, 245, 233, 1), // Light green
      icon: buildIcon(
        AppAssets.greenLeaf,
        8,
        8,
      ),
      title: healthScore != null ? 'Soil Health: $healthScore%' : 'soil status',
      status: status,
      statusColor: _getStatusColor(),
      width: SizeConfig.scaleWidth(42),
    );
  }
}

