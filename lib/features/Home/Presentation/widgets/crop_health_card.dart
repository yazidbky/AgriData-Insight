// import 'package:flutter/material.dart';
// import 'package:makers_hackathon/core/constants/app_assets.dart';
// import 'package:makers_hackathon/core/theme/app_colors.dart';
// import 'package:makers_hackathon/core/widgets/build_icon.dart';
// import 'package:makers_hackathon/core/widgets/size_config.dart';
// import 'package:makers_hackathon/features/Home/Presentation/widgets/status_card.dart';

// class CropHealthCard extends StatelessWidget {
//   final String status;

//   const CropHealthCard({
//     super.key,
//     this.status = 'Needs Attention',
//   });

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//     return StatusCard(
//       cardColor: const Color.fromRGBO(255, 243, 224, 1), // Light orange
//       icon: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           buildIcon(
//             AppAssets.orangeLeaf,
//             8,
//             8,
//           ),
//         ],
//       ),
//       title: 'Crop healthy',
//       status: status,
//       statusColor: AppColors.error, // Red for "Needs Attention"
//       width: double.infinity,
//     );
//   }
// }

