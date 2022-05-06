import 'package:weather_demo/infrastructure/environment/basic_configs.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String dev = 'DEV';
  static const String staging = 'STAGING';
  static const String prod = 'PROD';

  BaseConfig? config;

  BaseApi? baseApi;

  initConfig(String environment) {
    config = _getConfig(environment);
    baseApi = _baseApi(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.prod:
        return ProductConfig();
      case Environment.staging:
        return StagingConfig();
      default:
        return DeveloperConfig();
    }
  }

  BaseApi _baseApi(String environment) {
    switch (environment) {
      case Environment.prod:
        return ProdApi();
      default:
        return DevApi();
    }
  }
}
