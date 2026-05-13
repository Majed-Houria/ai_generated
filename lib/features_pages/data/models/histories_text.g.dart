// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'histories_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoriesText _$HistoriesTextFromJson(Map<String, dynamic> json) =>
    HistoriesText(
      id: json['_id'] as String,
      text: json['text'] as String,
      status: json['status'] as String,
      request: json['request'] as String,
      profanity: TextMatches.fromJson(
        json['profanity'] as Map<String, dynamic>,
      ),
      personal: TextMatches.fromJson(json['personal'] as Map<String, dynamic>),
      link: TextMatches.fromJson(json['link'] as Map<String, dynamic>),
      raw: RawData.fromJson(json['raw'] as Map<String, dynamic>),
      user: json['user'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$HistoriesTextToJson(HistoriesText instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'text': instance.text,
      'status': instance.status,
      'request': instance.request,
      'profanity': instance.profanity,
      'personal': instance.personal,
      'link': instance.link,
      'raw': instance.raw,
      'user': instance.user,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

TextMatches _$TextMatchesFromJson(Map<String, dynamic> json) =>
    TextMatches(matches: json['matches'] as List<dynamic>);

Map<String, dynamic> _$TextMatchesToJson(TextMatches instance) =>
    <String, dynamic>{'matches': instance.matches};

RawData _$RawDataFromJson(Map<String, dynamic> json) => RawData(
  status: json['status'] as String,
  request: RawRequest.fromJson(json['request'] as Map<String, dynamic>),
  profanity: TextMatches.fromJson(json['profanity'] as Map<String, dynamic>),
  personal: TextMatches.fromJson(json['personal'] as Map<String, dynamic>),
  link: TextMatches.fromJson(json['link'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RawDataToJson(RawData instance) => <String, dynamic>{
  'status': instance.status,
  'request': instance.request,
  'profanity': instance.profanity,
  'personal': instance.personal,
  'link': instance.link,
};

RawRequest _$RawRequestFromJson(Map<String, dynamic> json) => RawRequest(
  id: json['id'] as String,
  timestamp: (json['timestamp'] as num).toDouble(),
  operations: (json['operations'] as num).toInt(),
);

Map<String, dynamic> _$RawRequestToJson(RawRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'operations': instance.operations,
    };
