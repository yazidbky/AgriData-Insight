import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/constants/app_assets.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/build_icon.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/status_card.dart';

class SoilStatusCard extends StatelessWidget {
  final String status;

  const SoilStatusCard({
    super.key,
    this.status = 'Good',
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return StatusCard(
      cardColor: const Color.fromRGBO(232, 245, 233, 1), // Light green
      icon: buildIcon(
        AppAssets.greenLeaf,
        8,
        8,
      ),
      title: 'soil status',
      status: status,
      statusColor: AppColors.primary,
      width: SizeConfig.scaleWidth(42),
    );
  }
}

