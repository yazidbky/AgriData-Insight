import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/constants/app_assets.dart';
import 'package:makers_hackathon/core/widgets/build_icon.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';

class LogoWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const LogoWidget({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return buildIcon(
      AppAssets.logo,
      height ?? 15,
      width ?? 15,
    );
  }
}

