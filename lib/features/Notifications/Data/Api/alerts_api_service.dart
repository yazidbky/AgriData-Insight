import 'package:makers_hackathon/core/Database/api_consumer.dart';
import 'package:makers_hackathon/core/constants/Endpoint.dart';
import 'package:makers_hackathon/features/Notifications/Data/Models/alerts_response_model.dart';

class AlertsApiService {
  final ApiConsumer apiConsumer;

  AlertsApiService(this.apiConsumer);

  Future<AlertsResponseModel> getAlerts({
    int? limit,
    int? offset,
  }) async {
    final queryParams = <String, dynamic>{};
    if (limit != null) queryParams['limit'] = limit;
    if (offset != null) queryParams['offset'] = offset;

    final response = await apiConsumer.get(
      Endpoints.alertsEndPoint,
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );
    return AlertsResponseModel.fromJson(response);
  }
}

