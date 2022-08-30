// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parity_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParityHistory _$ParityHistoryFromJson(Map<String, dynamic> json) =>
    ParityHistory(
      close: (json['c'] as num?)?.toDouble(),
      date: json['d'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['d'], isUtc: true)
              .toLocal(),
      high: (json['h'] as num?)?.toDouble(),
      low: (json['l'] as num?)?.toDouble(),
      open: (json['o'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ParityHistoryToJson(ParityHistory instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'close': instance.close,
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
    };
