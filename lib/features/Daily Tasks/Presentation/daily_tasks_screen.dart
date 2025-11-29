import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/DI/dependency_injection.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Daily%20Tasks/Presentation/widgets/daily_tasks_header.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/recommendation_card.dart';
import 'package:makers_hackathon/features/Recommendation/Logic/recommendation_cubit.dart';
import 'package:makers_hackathon/features/Recommendation/Logic/recommendation_state.dart';
import 'package:makers_hackathon/features/User/Logic/user_cubit.dart';
import 'package:makers_hackathon/features/User/Logic/user_state.dart';

class DailyTasksScreen extends StatefulWidget {
  final UserCubit userCubit;

  const DailyTasksScreen({
    super.key,
    required this.userCubit,
  });

  @override
  State<DailyTasksScreen> createState() => _DailyTasksScreenState();
}

class _DailyTasksScreenState extends State<DailyTasksScreen> {
  late RecommendationCubit _recommendationCubit;
  bool _hasLoadedRecommendations = false;
  int? _farmerId;

  @override
  void initState() {
    super.initState();
    _recommendationCubit = getIt<RecommendationCubit>();
    // Listen to user state to get farmerId
    widget.userCubit.stream.listen((state) {
      if (state is UserSuccess && !_hasLoadedRecommendations) {
        _hasLoadedRecommendations = true;
        _farmerId = state.userData.id;
        _recommendationCubit.getCropRecommendations(
          farmerId: state.userData.id,
          landId: 1, // Default landId, can be made dynamic
        );
      }
    });
    // Check if user is already loaded
    if (widget.userCubit.state is UserSuccess) {
      final userState = widget.userCubit.state as UserSuccess;
      _hasLoadedRecommendations = true;
      _farmerId = userState.userData.id;
      _recommendationCubit.getCropRecommendations(
        farmerId: userState.userData.id,
        landId: 1,
      );
    }
  }

  void _retryLoadRecommendations() {
    if (_farmerId != null) {
      _recommendationCubit.getCropRecommendations(
        farmerId: _farmerId!,
        landId: 1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

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
            // Recommendations list from API
            Expanded(
              child: StreamBuilder<RecommendationState>(
                stream: _recommendationCubit.stream,
                initialData: _recommendationCubit.state,
                builder: (context, snapshot) {
                  final state = snapshot.data;

                  if (state is RecommendationLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  if (state is RecommendationFailure) {
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
                            onPressed: _retryLoadRecommendations,
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

                  if (state is RecommendationSuccess) {
                    final recommendations = state.recommendationData.recommendations;

                    if (recommendations.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.eco_outlined,
                              size: SizeConfig.scaleText(48),
                              color: AppColors.grey400,
                            ),
                            SizedBox(height: SizeConfig.scaleHeight(2)),
                            CustomText(
                              'No recommendations yet',
                              fontSize: 16,
                              color: AppColors.grey600,
                            ),
                          ],
                        ),
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () async => _retryLoadRecommendations(),
                      color: AppColors.primary,
                      child: ListView.builder(
                        padding: SizeConfig.scalePadding(
                          horizontal: 4,
                          vertical: 0,
                        ),
                        itemCount: recommendations.length,
                        itemBuilder: (context, index) {
                          final recommendation = recommendations[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: SizeConfig.scaleHeight(1.5),
                            ),
                            child: RecommendationCard(
                              cropName: recommendation.cropName,
                              similarityPercentage: recommendation.similarityPercentage,
                              growingSeason: recommendation.cropData.growingSeason,
                              waterRequirement: recommendation.cropData.waterRequirement,
                              rank: recommendation.rank,
                            ),
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

