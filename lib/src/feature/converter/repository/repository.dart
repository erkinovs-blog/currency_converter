import 'package:currency_converter/src/feature/converter/models/all_currency.dart';

import '../../../common/constants/api_const.dart';
import '../../../common/services/api_service.dart';
import '../models/single_currency.dart';

abstract interface class ICurrencyRepository {
  const ICurrencyRepository();

  Future<List<String>> getAllCurrency();
  Future<num> getSingleCurrencyData({
    required String currencyCode,
    required String ccy,
  });
}

class CurrencyRepositoryImpl implements ICurrencyRepository {
  final APIService apiService;

  const CurrencyRepositoryImpl(this.apiService);

  @override
  Future<List<String>> getAllCurrency() async {
    String response = await apiService.request(ApiConst.allCurrencyPath);
    AllCurrency allCurrency = AllCurrency.fromJson(response);
    return allCurrency.supportedCodes?.map((e) => e.first).toList() ?? [];
  }

  @override
  Future<num> getSingleCurrencyData({
    required String currencyCode,
    required String ccy,
  }) async {
    String response =
        await apiService.request(ApiConst.getSingleCurrency(currencyCode));
    return SingleCurrency.fromJson(response).conversionRates![ccy] ?? 0;
  }
}
