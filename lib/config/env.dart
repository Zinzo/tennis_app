const bool isProduction = bool.fromEnvironment('dart.vm.product');

const testConfig = {
  'baseUrl': 'http://127.0.0.1:3333/'
};

const productionConfig = {
  'baseUrl' : 'http://127.0.0.1:3333/'
};

final environment = isProduction ? productionConfig : testConfig;