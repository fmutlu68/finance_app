// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityHistory _$CommodityHistoryFromJson(Map<String, dynamic> json) =>
    CommodityHistory(
      close: (json['c'] as num?)?.toDouble(),
      date: json['d'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['d'], isUtc: true)
              .toLocal(),
      high: (json['h'] as num?)?.toDouble(),
      low: (json['l'] as num?)?.toDouble(),
      open: (json['o'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CommodityHistoryToJson(CommodityHistory instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'close': instance.close,
      'high': instance.high,
      'low': instance.low,
      'open': instance.open,
    };
