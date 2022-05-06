import 'dart:io';

abstract class BaseConfig {
  String get appId;

  String get messagingSenderId;

  String get apiKey;

  String get projectId;

  String get streamFeedAPIKey;

  String get googleMapsApiKey;

  String get shakeBugsClientId;

  String get shakeBugsSecret;

  String get flagSmithApiKey;

  String get streamChatAPIKey;

  String get rudderStackKey;
}

abstract class BaseApi {
  String get feedBaseUrl;

  String get mediaBaseUrl;

  String get lookupBaseUrl;

  String get terraBaseUrl;
}

class DeveloperConfig implements BaseConfig {
  @override
  String get apiKey => Platform.isIOS
      ? 'AIzaSyCBbeOMh6W_FeC8qyxV-1ZK6UtYs_1HSdw'
      : 'AIzaSyDFUZRCAhfnE9OrjDb24nycADaFr-fp2TE';

  @override
  String get appId => Platform.isIOS
      ? '1:302493094096:ios:7223c7390b2441dd6d8ed5'
      : '1:302493094096:android:de5a8f2b1757151e6d8ed5';

  @override
  String get messagingSenderId => '302493094096';

  @override
  String get projectId => 'swipu-159a2';

  @override
  String get streamFeedAPIKey => "vvzex8p2bwjs";

  @override
  String get googleMapsApiKey => "AIzaSyAit0M9mMKuY3oVcXF-IrFFnvy3ZfliS3w";

  @override
  String get shakeBugsClientId => "swbSbeM9hHwfaVg94tyN55NyE79NPJcUNOMOBVHw";

  @override
  String get shakeBugsSecret =>
      "gUbdeVBa8cCsGXnRPfElIcxd0eUTBLj54j3Uv7Hwx16j16UznUXfqhi";

  @override
  String get flagSmithApiKey => "JpYQ72KVhMFbD4cGzCgGQd";

  @override
  String get streamChatAPIKey => "upgy5mvc3rmg";

  @override
  String get rudderStackKey => "272yOrZ8nLhw4ZC18X5z6nGjGkd";
}

class ProductConfig implements BaseConfig {
  @override
  String get apiKey => Platform.isIOS
      ? 'AIzaSyCBbeOMh6W_FeC8qyxV-1ZK6UtYs_1HSdw'
      : 'AIzaSyBukfGPfoqmaL6i1vB9ag1HXOE-1K17uQk';

  @override
  String get appId => Platform.isIOS
      ? '1:302493094096:ios:7223c7390b2441dd6d8ed5'
      : '1:449220924469:android:6df4de2d5dceb235c3cd7c';

  @override
  String get messagingSenderId => '449220924469d';

  @override
  String get projectId => 'swipu-prod-dcbd4';

  @override
  String get streamFeedAPIKey => "btg68u7a5gp4";

  @override
  String get googleMapsApiKey => "AIzaSyAit0M9mMKuY3oVcXF-IrFFnvy3ZfliS3w";

  @override
  String get shakeBugsClientId => "swbSbeM9hHwfaVg94tyN55NyE79NPJcUNOMOBVHw";

  @override
  String get shakeBugsSecret =>
      "gUbdeVBa8cCsGXnRPfElIcxd0eUTBLj54j3Uv7Hwx16j16UznUXfqhi";

  @override
  String get flagSmithApiKey => "aHypXWdpyqacZeiNoGym7w";

  @override
  String get streamChatAPIKey => "xvctvwhdbmq8";

  @override
  String get rudderStackKey => "272yOrZ8nLhw4ZC18X5z6nGjGkd";
}

class StagingConfig implements BaseConfig {
  @override
  String get apiKey => Platform.isIOS
      ? 'AIzaSyCBbeOMh6W_FeC8qyxV-1ZK6UtYs_1HSdw'
      : 'AIzaSyDFUZRCAhfnE9OrjDb24nycADaFr-fp2TE';

  @override
  String get appId => Platform.isIOS
      ? '1:302493094096:ios:7223c7390b2441dd6d8ed5'
      : '1:302493094096:android:de5a8f2b1757151e6d8ed5';

  @override
  String get messagingSenderId => '302493094096';

  @override
  String get projectId => 'swipu-159a2';

  @override
  String get streamFeedAPIKey => "vvzex8p2bwjs";

  @override
  String get googleMapsApiKey => "AIzaSyAit0M9mMKuY3oVcXF-IrFFnvy3ZfliS3w";

  @override
  String get shakeBugsClientId => "swbSbeM9hHwfaVg94tyN55NyE79NPJcUNOMOBVHw";

  @override
  String get shakeBugsSecret =>
      "gUbdeVBa8cCsGXnRPfElIcxd0eUTBLj54j3Uv7Hwx16j16UznUXfqhi";

  @override
  String get flagSmithApiKey => "JpYQ72KVhMFbD4cGzCgGQd";

  @override
  String get streamChatAPIKey => "upgy5mvc3rmg";

  @override
  String get rudderStackKey => "272yOrZ8nLhw4ZC18X5z6nGjGkd";
}

class DevApi implements BaseApi {
  @override
  String get feedBaseUrl => 'https://swipu-159a2.el.r.appspot.com/';

  @override
  String get lookupBaseUrl =>
      'https://swipu-lookup-service-dot-swipu-159a2.el.r.appspot.com/';

  @override
  String get mediaBaseUrl =>
      'https://swipu-media-service-dot-swipu-159a2.el.r.appspot.com/';

  @override
  String get terraBaseUrl => 'https://terra-api.terra.do/dev/swipu/';
}

class ProdApi implements BaseApi {
  @override
  String get feedBaseUrl => 'https://swipu-prod-dcbd4.uc.r.appspot.com/';

  @override
  String get lookupBaseUrl =>
      'https://swipu-lookup-service-dot-swipu-prod-dcbd4.uc.r.appspot.com/';

  @override
  String get mediaBaseUrl =>
      'https://swipu-media-service-dot-swipu-prod-dcbd4.uc.r.appspot.com/';

  @override
  String get terraBaseUrl => 'https://api.terra.do/stage/swipu/';
}
