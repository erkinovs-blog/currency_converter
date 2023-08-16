// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PairConversion {
  String? result;
  String? documentation;
  String? termsOfUse;
  int? timeLastUpdateUnix;
  String? timeLastUpdateUtc;
  int? timeNextUpdateUnix;
  String? timeNextUpdateUtc;
  String? baseCode;
  String? targetCode;
  num? conversionRate;
  num? conversionResult;

  PairConversion({
    this.result,
    this.documentation,
    this.termsOfUse,
    this.timeLastUpdateUnix,
    this.timeLastUpdateUtc,
    this.timeNextUpdateUnix,
    this.timeNextUpdateUtc,
    this.baseCode,
    this.targetCode,
    this.conversionRate,
    this.conversionResult,
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
      'target_code': targetCode,
      'conversion_rate': conversionRate,
      'conversion_result': conversionResult,
    };
  }

  factory PairConversion.fromMap(Map<String, Object?> map) {
    return PairConversion(
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
      targetCode:
          map['target_code'] != null ? map['target_code'] as String : null,
      conversionRate:
          map['conversion_rate'] != null ? map['conversion_rate'] as num : null,
      conversionResult: map["conversion_result"] != null
          ? map['conversion_result'] as num
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PairConversion.fromJson(String source) =>
      PairConversion.fromMap(json.decode(source) as Map<String, Object?>);

  @override
  String toString() {
    return 'PairConversion(result: $result, documentation: $documentation, termsOfUse: $termsOfUse, timeLastUpdateUnix: $timeLastUpdateUnix, timeLastUpdateUtc: $timeLastUpdateUtc, timeNextUpdateUnix: $timeNextUpdateUnix, timeNextUpdateUtc: $timeNextUpdateUtc, baseCode: $baseCode, targetCode: $targetCode, conversionRate: $conversionRate, conversionResult: $conversionResult)';
  }

  @override
  bool operator ==(covariant PairConversion other) {
    if (identical(this, other)) return true;

    return other.result == result &&
        other.documentation == documentation &&
        other.termsOfUse == termsOfUse &&
        other.timeLastUpdateUnix == timeLastUpdateUnix &&
        other.timeLastUpdateUtc == timeLastUpdateUtc &&
        other.timeNextUpdateUnix == timeNextUpdateUnix &&
        other.timeNextUpdateUtc == timeNextUpdateUtc &&
        other.baseCode == baseCode &&
        other.targetCode == targetCode &&
        other.conversionRate == conversionRate;
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
        targetCode.hashCode ^
        conversionRate.hashCode;
  }
}

void main(List<String> args) {}
