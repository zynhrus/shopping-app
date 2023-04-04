import 'package:fit_hub_project/config/models/api_error_model.dart';

class FrontendErrors {
  FrontendErrors._();

  static ApiErrorModel get apiConnectionTimeout =>
      const ApiErrorModel(error: "ApiTimeOut");
}

class BackendErrors {
  BackendErrors._();

  static ApiErrorModel get forbidden => const ApiErrorModel(error: "Forbidden");

  static ApiErrorModel get unknown => const ApiErrorModel(error: "Unknown");
}
