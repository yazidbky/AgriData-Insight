import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/constants/app_assets.dart';
import 'package:makers_hackathon/core/widgets/build_icon.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/status_card.dart';

class WeatherStatusCard extends StatelessWidget {
  final String status;

  const WeatherStatusCard({
    super.key,
    this.status = 'Safe',
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return StatusCard(
      cardColor: const Color.fromRGBO(227, 242, 253, 1), // Light blue
      icon: buildIcon(
        AppAssets.weatherStatus,
        8,
        8,
      ),
      title: 'Weather status',
      status: status,
      statusColor: const Color.fromRGBO(25, 118, 210, 1), // Dark blue
      width: SizeConfig.scaleWidth(42),
    );
  }
}

