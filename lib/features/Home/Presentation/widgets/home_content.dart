import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/DI/dependency_injection.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/home_header.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/soil_status_card.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/weather_status_card.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/crop_health_list_card.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/recommendation_card.dart';
import 'package:makers_hackathon/features/Home/soil%20status/Logic/soil_status_cubit.dart';
import 'package:makers_hackathon/features/Home/soil%20status/Logic/soil_status_state.dart';
import 'package:makers_hackathon/features/Home/weather%20status/Logic/weather_status_cubit.dart';
import 'package:makers_hackathon/features/Home/weather%20status/Logic/weather_status_state.dart';
import 'package:makers_hackathon/features/Recommendation/Logic/recommendation_cubit.dart';
import 'package:makers_hackathon/features/Recommendation/Logic/recommendation_state.dart';
import 'package:makers_hackathon/features/User/Logic/user_cubit.dart';
import 'package:makers_hackathon/features/User/Logic/user_state.dart';

class HomeContent extends StatefulWidget {
  final UserCubit userCubit;

  const HomeContent({
    super.key,
    required this.userCubit,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late RecommendationCubit _recommendationCubit;
  late SoilStatusCubit _soilStatusCubit;
  late WeatherStatusCubit _weatherStatusCubit;
  bool _hasLoadedData = false;

  @override
  void initState() {
    super.initState();
    _recommendationCubit = getIt<RecommendationCubit>();
    _soilStatusCubit = getIt<SoilStatusCubit>();
    _weatherStatusCubit = getIt<WeatherStatusCubit>();
    
    // Listen to user state to get farmerId
    widget.userCubit.stream.listen((state) {
      if (state is UserSuccess && !_hasLoadedData) {
        _hasLoadedData = true;
        _loadData(state.userData.id);
      }
    });
    // Check if user is already loaded
    if (widget.userCubit.state is UserSuccess) {
      final userState = widget.userCubit.state as UserSuccess;
      _hasLoadedData = true;
      _loadData(userState.userData.id);
    }
  }

  void _loadData(int farmerId) {
    _recommendationCubit.getCropRecommendations(
      farmerId: farmerId,
      landId: 1,
    );
    _soilStatusCubit.getSoilStatus(farmerId: farmerId);
    _weatherStatusCubit.getWeatherStatus(farmerId: farmerId);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: StreamBuilder<UserState>(
        stream: widget.userCubit.stream,
        initialData: widget.userCubit.state,
        builder: (context, userSnapshot) {
          String userName = 'Farmer';
          
          if (userSnapshot.data is UserSuccess) {
            final userState = userSnapshot.data as UserSuccess;
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
                    children: [
                      // Soil Status Card with API data
                      StreamBuilder<SoilStatusState>(
                        stream: _soilStatusCubit.stream,
                        initialData: _soilStatusCubit.state,
                        builder: (context, snapshot) {
                          final state = snapshot.data;
                          
                          if (state is SoilStatusLoading) {
                            return const SoilStatusCard(isLoading: true);
                          }
                          
                          if (state is SoilStatusSuccess) {
                            return SoilStatusCard(
                              status: state.soilStatusData.overallStatus,
                              healthScore: state.soilStatusData.overallHealthScore,
                            );
                          }
                          
                          // Default/error state
                          return const SoilStatusCard(status: '--');
                        },
                      ),
                      // Weather Status Card with API data
                      StreamBuilder<WeatherStatusState>(
                        stream: _weatherStatusCubit.stream,
                        initialData: _weatherStatusCubit.state,
                        builder: (context, snapshot) {
                          final state = snapshot.data;
                          
                          if (state is WeatherStatusLoading) {
                            return const WeatherStatusCard(isLoading: true);
                          }
                          
                          if (state is WeatherStatusSuccess) {
                            return WeatherStatusCard(
                              status: state.weatherStatusData.overallWeatherStatus,
                              temperature: state.weatherStatusData.overallAverageTemperature,
                            );
                          }
                          
                          // Default/error state
                          return const WeatherStatusCard(status: '--');
                        },
                      ),
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
                // Single recommendation from API
                Padding(
                  padding: SizeConfig.horizontalPadding(4),
                  child: StreamBuilder<RecommendationState>(
                    stream: _recommendationCubit.stream,
                    initialData: _recommendationCubit.state,
                    builder: (context, snapshot) {
                      final state = snapshot.data;

                      if (state is RecommendationLoading) {
                        return Container(
                          width: double.infinity,
                          padding: SizeConfig.allPadding(4),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(227, 242, 253, 1),
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

                      if (state is RecommendationSuccess) {
                        final recommendations = state.recommendationData.recommendations;
                        if (recommendations.isNotEmpty) {
                          final topRecommendation = recommendations.first;
                          return RecommendationCard(
                            cropName: topRecommendation.cropName,
                            similarityPercentage: topRecommendation.similarityPercentage,
                            growingSeason: topRecommendation.cropData.growingSeason,
                            waterRequirement: topRecommendation.cropData.waterRequirement,
                            rank: topRecommendation.rank,
                          );
                        }
                      }

                      // Default/error state
                      return Container(
                        width: double.infinity,
                        padding: SizeConfig.allPadding(4),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(227, 242, 253, 1),
                          borderRadius: BorderRadius.circular(SizeConfig.scaleRadius(3)),
                        ),
                        child: CustomText(
                          'No recommendations available',
                          fontSize: 14,
                          color: AppColors.grey600,
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
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

