import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/constants/app_assets.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/build_icon.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/status_card.dart';

class WeatherStatusCard extends StatelessWidget {
  final String status;
  final double? temperature;
  final bool isLoading;

  const WeatherStatusCard({
    super.key,
    this.status = 'Safe',
    this.temperature,
    this.isLoading = false,
  });

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'great':
      case 'good':
        return const Color.fromRGBO(25, 118, 210, 1); // Dark blue
      case 'moderate':
      case 'warning':
        return Colors.orange;
      case 'bad':
      case 'severe':
        return AppColors.error;
      default:
        return const Color.fromRGBO(25, 118, 210, 1);
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
          color: const Color.fromRGBO(227, 242, 253, 1),
          borderRadius: BorderRadius.circular(SizeConfig.scaleRadius(3)),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: Color.fromRGBO(25, 118, 210, 1),
            strokeWidth: 2,
          ),
        ),
      );
    }

    return StatusCard(
      cardColor: const Color.fromRGBO(227, 242, 253, 1), // Light blue
      icon: buildIcon(
        AppAssets.weatherStatus,
        8,
        8,
      ),
      title: temperature != null ? '${temperature!.toStringAsFixed(1)}°C Avg' : 'Weather status',
      status: status,
      statusColor: _getStatusColor(),
      width: SizeConfig.scaleWidth(42),
    );
  }
}

