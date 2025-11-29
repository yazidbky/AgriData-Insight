import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/home_header.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/soil_status_card.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/weather_status_card.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/crop_health_list_card.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/recommendation_card.dart';
import 'package:makers_hackathon/features/User/Logic/user_cubit.dart';
import 'package:makers_hackathon/features/User/Logic/user_state.dart';

class HomeContent extends StatelessWidget {
  final UserCubit userCubit;

  const HomeContent({
    super.key,
    required this.userCubit,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: StreamBuilder<UserState>(
        stream: userCubit.stream,
        initialData: userCubit.state,
        builder: (context, snapshot) {
          String userName = 'Farmer';
          
          if (snapshot.data is UserSuccess) {
            final userState = snapshot.data as UserSuccess;
            // Extract first name from full name, or use full name
            final nameParts = userState.userData.fullName.split(' ');
            userName = nameParts.isNotEmpty ? nameParts[0] : userState.userData.fullName;
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(userName: userName),
            Padding(
              padding: SizeConfig.horizontalPadding(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SoilStatusCard(status: 'Good'),
                  WeatherStatusCard(status: 'Safe'),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.scaleHeight(2)),
            Padding(
              padding: SizeConfig.horizontalPadding(4),
              child: const CropHealthListCard(status: 'Needs Attention'),
            ),
            SizedBox(height: SizeConfig.scaleHeight(3)),
            Padding(
              padding: SizeConfig.horizontalPadding(4),
              child: CustomText(
                'Recommendation of the day',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: SizeConfig.scaleHeight(1.5)),
            Padding(
              padding: SizeConfig.horizontalPadding(4),
              child: const RecommendationCard(
                recommendation: 'Irrigate your crops for 20 minutes this evening',
              ),
            ),
                SizedBox(height: SizeConfig.scaleHeight(3)),
              ],
            ),
          );
        },
      ),
    );
  }
}

