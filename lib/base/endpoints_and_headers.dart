class EstimatesEndposintAndHeaders {
  static const BASE_URL = "https://api-dev.itestimators.com/api";

  static const REGISTER_ENDPOINT = "/user/register";

  static const DEFAULT_HEADER = {
    "Content-type": "application/json",
    "client-id": "application-client"
  };

  static String linkWithBase(String endPoint) {
    return BASE_URL + endPoint;
  }
}
