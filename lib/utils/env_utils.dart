class EnvUtils {
  static const BASE_URL = 'https://pro-api.coinmarketcap.com/v1/';
  static const API_KEY = '02e39228-2e95-4d79-a2e5-ac9974199182';
  static const endPoint_latest = 'cryptocurrency/listings/latest';

  static Map<String, String> get HEADERS => {
        // "Accept": "application/json",
        // "Access-Control_Allow_Origin": "*",
        "X-CMC_PRO_API_KEY": EnvUtils.API_KEY,
      };
}
