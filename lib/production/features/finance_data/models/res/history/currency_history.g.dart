// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyHistory _$CurrencyHistoryFromJson(Map<String, dynamic> json) =>
    CurrencyHistory(
      close: (json['c'] as num?)?.toDouble(),
      date: json['d'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['d'], isUtc: true)
              .toLocal(),
      high: (json['h'] as num?)?.toDouble(),
      low: (json['l'] as num?)?.toDouble(),
      open: (json['o'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrencyHistoryToJson(CurrencyHistory instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'close': instance.close,
      'high': instance.high,
      'low': instance.low,
      'open': instance.open,
    };
