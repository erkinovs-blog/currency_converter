// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class SingleCurrency {
  String? result;
  String? documentation;
  String? termsOfUse;
  int? timeLastUpdateUnix;
  String? timeLastUpdateUtc;
  int? timeNextUpdateUnix;
  String? timeNextUpdateUtc;
  String? baseCode;
  Map<String, num>? conversionRates;

  SingleCurrency({
    this.result,
    this.documentation,
    this.termsOfUse,
    this.timeLastUpdateUnix,
    this.timeLastUpdateUtc,
    this.timeNextUpdateUnix,
    this.timeNextUpdateUtc,
    this.baseCode,
    this.conversionRates,
  });

  Map<String, dynamic> toMap() {
    return <String, Object?>{
      'result': result,
      'documentation': documentation,
      'terms_of_use': termsOfUse,
      'time_last_update_unix': timeLastUpdateUnix,
      'time_last_update_utc': timeLastUpdateUtc,
      'time_next_update_unix': timeNextUpdateUnix,
      'time_next_update_utc': timeNextUpdateUtc,
      'base_code': baseCode,
      'conversion_rates': conversionRates,
    };
  }

  factory SingleCurrency.fromMap(Map<String, Object?> map) {
    return SingleCurrency(
      result: map['result'] != null ? map['result'] as String : null,
      documentation:
          map['documentation'] != null ? map['documentation'] as String : null,
      termsOfUse:
          map['terms_of_use'] != null ? map['terms_of_use'] as String : null,
      timeLastUpdateUnix: map['time_last_update_unix'] != null
          ? map['time_last_update_unix'] as int
          : null,
      timeLastUpdateUtc: map['time_last_update_utc'] != null
          ? map['time_last_update_utc'] as String
          : null,
      timeNextUpdateUnix: map['time_next_update_unix'] != null
          ? map['time_next_update_unix'] as int
          : null,
      timeNextUpdateUtc: map['time_next_update_utc'] != null
          ? map['time_next_update_utc'] as String
          : null,
      baseCode: map['base_code'] != null ? map['base_code'] as String : null,
      conversionRates: map['conversion_rates'] != null
          ? (map['conversion_rates'] as Map).cast<String, num>()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SingleCurrency.fromJson(String source) =>
      SingleCurrency.fromMap(json.decode(source) as Map<String, Object?>);

  @override
  String toString() {
    return 'SingleCurrency(result: $result, documentation: $documentation, termsOfUse: $termsOfUse, timeLastUpdateUnix: $timeLastUpdateUnix, timeLastUpdateUtc: $timeLastUpdateUtc, timeNextUpdateUnix: $timeNextUpdateUnix, timeNextUpdateUtc: $timeNextUpdateUtc, baseCode: $baseCode, conversionRates: $conversionRates)';
  }

  @override
  bool operator ==(covariant SingleCurrency other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other.result == result &&
        other.documentation == documentation &&
        other.termsOfUse == termsOfUse &&
        other.timeLastUpdateUnix == timeLastUpdateUnix &&
        other.timeLastUpdateUtc == timeLastUpdateUtc &&
        other.timeNextUpdateUnix == timeNextUpdateUnix &&
        other.timeNextUpdateUtc == timeNextUpdateUtc &&
        other.baseCode == baseCode &&
        mapEquals(other.conversionRates, conversionRates);
  }

  @override
  int get hashCode {
    return result.hashCode ^
        documentation.hashCode ^
        termsOfUse.hashCode ^
        timeLastUpdateUnix.hashCode ^
        timeLastUpdateUtc.hashCode ^
        timeNextUpdateUnix.hashCode ^
        timeNextUpdateUtc.hashCode ^
        baseCode.hashCode ^
        conversionRates.hashCode;
  }

  SingleCurrency copyWith({
    String? result,
    String? documentation,
    String? termsOfUse,
    int? timeLastUpdateUnix,
    String? timeLastUpdateUtc,
    int? timeNextUpdateUnix,
    String? timeNextUpdateUtc,
    String? baseCode,
    Map<String, num>? conversionRates,
  }) {
    return SingleCurrency(
      result: result ?? this.result,
      documentation: documentation ?? this.documentation,
      termsOfUse: termsOfUse ?? this.termsOfUse,
      timeLastUpdateUnix: timeLastUpdateUnix ?? this.timeLastUpdateUnix,
      timeLastUpdateUtc: timeLastUpdateUtc ?? this.timeLastUpdateUtc,
      timeNextUpdateUnix: timeNextUpdateUnix ?? this.timeNextUpdateUnix,
      timeNextUpdateUtc: timeNextUpdateUtc ?? this.timeNextUpdateUtc,
      baseCode: baseCode ?? this.baseCode,
      conversionRates: conversionRates ?? this.conversionRates,
    );
  }
}

// void main(List<String> args) {
//   SingleCurrency singleCurrency = SingleCurrency(
//     result: "success",
//     documentation: "https://www.exchangerate-api.com/docs",
//     termsOfUse: "https://www.exchangerate-api.com/terms",
//     timeLastUpdateUnix: 1691798402,
//     timeLastUpdateUtc: "Sat, 12 Aug 2023 00:00:02 +0000",
//     timeNextUpdateUnix: 1691884802,
//     timeNextUpdateUtc: "Sun, 13 Aug 2023 00:00:02 +0000",
//     baseCode: "USD",
//     conversionRates: {
//       "USD": 1,
//       "AED": 3.6725,
//       "AFN": 84.3767,
//       "ALL": 94.0875,
//       "AMD": 386.0327,
//       "ANG": 1.7900,
//       "AOA": 832.8508,
//       "ARS": 284.8485,
//       "AUD": 1.5376,
//       "AWG": 1.7900,
//       "AZN": 1.7000,
//       "BAM": 1.7834,
//       "BBD": 2.0000,
//       "BDT": 109.4741,
//       "BGN": 1.7828,
//       "BHD": 0.3760,
//       "BIF": 2824.3258,
//       "BMD": 1.0000,
//       "BND": 1.3499,
//     },
//   );
//   final str = singleCurrency.toJson();
//   print(SingleCurrency.fromJson(str).runtimeType);
// }

/*

{
    "result": "success",
    "documentation": "https://www.exchangerate-api.com/docs",
    "terms_of_use": "https://www.exchangerate-api.com/terms",
    "time_last_update_unix": 1691798402,
    "time_last_update_utc": "Sat, 12 Aug 2023 00:00:02 +0000",
    "time_next_update_unix": 1691884802,
    "time_next_update_utc": "Sun, 13 Aug 2023 00:00:02 +0000",
    "base_code": "USD",
    "conversion_rates": {
        "USD": 1,
        "AED": 3.6725,
        "AFN": 84.3767,
        "ALL": 94.0875,
        "AMD": 386.0327,
        "ANG": 1.7900,
        "AOA": 832.8508,
        "ARS": 284.8485,
        "AUD": 1.5376,
        "AWG": 1.7900,
        "AZN": 1.7000,
        "BAM": 1.7834,
        "BBD": 2.0000,
        "BDT": 109.4741,
        "BGN": 1.7828,
        "BHD": 0.3760,
        "BIF": 2824.3258,
        "BMD": 1.0000,
        "BND": 1.3499,
        "BOB": 6.9287,
        "BRL": 4.8938,
        "BSD": 1.0000,
        "BTN": 82.8661,
        "BWP": 13.5489,
        "BYN": 2.8790,
        "BZD": 2.0000,
        "CAD": 1.3431,
        "CDF": 2314.7637,
        "CHF": 0.8759,
        "CLP": 849.6704,
        "CNY": 7.2377,
        "COP": 4054.8716,
        "CRC": 537.6758,
        "CUP": 24.0000,
        "CVE": 100.5464,
        "CZK": 21.9637,
        "DJF": 177.7210,
        "DKK": 6.7949,
        "DOP": 56.6812,
        "DZD": 135.8349,
        "EGP": 30.9047,
        "ERN": 15.0000,
        "ETB": 55.3112,
        "EUR": 0.9119,
        "FJD": 2.2357,
        "FKP": 0.7869,
        "FOK": 6.8028,
        "GBP": 0.7869,
        "GEL": 2.6215,
        "GGP": 0.7869,
        "GHS": 11.2612,
        "GIP": 0.7869,
        "GMD": 62.8766,
        "GNF": 8568.6694,
        "GTQ": 7.8666,
        "GYD": 209.4242,
        "HKD": 7.8169,
        "HNL": 24.6056,
        "HRK": 6.8704,
        "HTG": 136.6428,
        "HUF": 348.9742,
        "IDR": 15287.8058,
        "ILS": 3.7323,
        "IMP": 0.7869,
        "INR": 82.8663,
        "IQD": 1313.7350,
        "IRR": 41969.4143,
        "ISK": 131.4804,
        "JEP": 0.7869,
        "JMD": 154.4603,
        "JOD": 0.7090,
        "JPY": 144.7346,
        "KES": 143.8843,
        "KGS": 87.8522,
        "KHR": 4147.6950,
        "KID": 1.5372,
        "KMF": 448.6064,
        "KRW": 1328.8705,
        "KWD": 0.3076,
        "KYD": 0.8333,
        "KZT": 446.0401,
        "LAK": 19327.6070,
        "LBP": 15000.0000,
        "LKR": 319.5933,
        "LRD": 186.5221,
        "LSL": 18.8924,
        "LYD": 4.7965,
        "MAD": 9.8532,
        "MDL": 17.6395,
        "MGA": 4443.9985,
        "MKD": 55.8897,
        "MMK": 2103.4056,
        "MNT": 3422.6410,
        "MOP": 8.0514,
        "MRU": 37.8993,
        "MUR": 45.1482,
        "MVR": 15.4557,
        "MWK": 1090.9419,
        "MXN": 17.0048,
        "MYR": 4.5809,
        "MZN": 63.9123,
        "NAD": 18.8924,
        "NGN": 756.9969,
        "NIO": 36.6031,
        "NOK": 10.4089,
        "NPR": 132.5858,
        "NZD": 1.6692,
        "OMR": 0.3845,
        "PAB": 1.0000,
        "PEN": 3.7009,
        "PGK": 3.5835,
        "PHP": 56.4470,
        "PKR": 287.8213,
        "PLN": 4.0434,
        "PYG": 7293.2251,
        "QAR": 3.6400,
        "RON": 4.4901,
        "RSD": 106.8132,
        "RUB": 98.7511,
        "RWF": 1222.5286,
        "SAR": 3.7500,
        "SBD": 8.5027,
        "SCR": 13.3007,
        "SDG": 558.8937,
        "SEK": 10.7940,
        "SGD": 1.3499,
        "SHP": 0.7869,
        "SLE": 22.0284,
        "SLL": 22028.3555,
        "SOS": 569.6738,
        "SRD": 38.1346,
        "SSP": 1008.5799,
        "STN": 22.3406,
        "SYP": 12964.2638,
        "SZL": 18.8924,
        "THB": 35.0820,
        "TJS": 10.9135,
        "TMT": 3.5006,
        "TND": 3.0764,
        "TOP": 2.3429,
        "TRY": 27.0158,
        "TTD": 6.7313,
        "TVD": 1.5372,
        "TWD": 31.8059,
        "TZS": 2505.0705,
        "UAH": 36.7839,
        "UGX": 3704.8532,
        "UYU": 38.2109,
        "UZS": 12029.3412,
        "VES": 31.5251,
        "VND": 23755.6741,
        "VUV": 120.6926,
        "WST": 2.7440,
        "XAF": 598.1419,
        "XCD": 2.7000,
        "XDR": 0.7474,
        "XOF": 598.1419,
        "XPF": 108.8143,
        "YER": 250.3730,
        "ZAR": 18.8925,
        "ZMW": 19.0267,
        "ZWL": 4628.3117
    }
}

*/
