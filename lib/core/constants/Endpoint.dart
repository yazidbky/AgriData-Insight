class Endpoints {
  static const loginEndPoint = "/api/auth/farmer/login";
  static const registerEndPoint = "/api/auth/farmer/register";
  static const userProfileEndPoint = "/api/auth/farmer/profile";
  static const healthEndPoint = "/api/health";
  static const weatherFetchAndSaveEndPoint = "/api/weather/fetch-and-save";
  static const alertsEndPoint = "/api/alerts";
  
  /// Recommendations endpoint - requires farmerId and landId as path params
  /// Usage: recommendationsEndPoint(farmerId, landId)
  static String recommendationsEndPoint(int farmerId, int landId) =>
      "/api/recommendations/$farmerId/$landId";

  /// Soil status endpoint - requires farmerId as path param
  /// Usage: soilStatusEndPoint(farmerId)
  static String soilStatusEndPoint(int farmerId) =>
      "/api/soil/farmer/$farmerId/status";

  /// Weather status endpoint - requires farmerId as path param
  /// Usage: weatherStatusEndPoint(farmerId)
  static String weatherStatusEndPoint(int farmerId) =>
      "/api/weather/farmer/$farmerId/status";
}