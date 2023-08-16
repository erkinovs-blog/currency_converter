abstract final class ApiConst {
  static const _baseUrl = "https://v6.exchangerate-api.com/v6";

  static const _apiKey = "cf0826eaf48244ea7e62b1dd";

  /// Paths
  static const mainPath = "$_baseUrl/$_apiKey";
  static const allCurrencyPath = "$mainPath/codes";

  /// Path with function
  ///
  /// Get Single Currency by Currency Code
  static String getSingleCurrency(String ccy) {
    return "$mainPath/latest/$ccy";
  }

  /// Get converted currency by two currency code
  static String getPairCurrency({
    required String base,
    required String target,
  }) {
    return "$mainPath/pair/$base/$target";
  }
}
