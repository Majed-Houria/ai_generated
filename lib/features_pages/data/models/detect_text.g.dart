// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detect_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetectText _$DetectTextFromJson(Map<String, dynamic> json) => DetectText(
  status: json['status'] as String,
  request: TextRequest.fromJson(json['request'] as Map<String, dynamic>),
  profanity: TextMatches.fromJson(json['profanity'] as Map<String, dynamic>),
  personal: TextMatches.fromJson(json['personal'] as Map<String, dynamic>),
  link: TextMatches.fromJson(json['link'] as Map<String, dynamic>),
  scores: json['scores'] == null
      ? null
      : TextScores.fromJson(json['scores'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DetectTextToJson(DetectText instance) =>
    <String, dynamic>{
      'status': instance.status,
      'request': instance.request,
      'profanity': instance.profanity,
      'personal': instance.personal,
      'link': instance.link,
      'scores': instance.scores,
    };

TextRequest _$TextRequestFromJson(Map<String, dynamic> json) => TextRequest(
  id: json['id'] as String,
  timestamp: (json['timestamp'] as num).toDouble(),
  operations: (json['operations'] as num).toInt(),
);

Map<String, dynamic> _$TextRequestToJson(TextRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'operations': instance.operations,
    };

TextMatches _$TextMatchesFromJson(Map<String, dynamic> json) => TextMatches(
  matches: (json['matches'] as List<dynamic>)
      .map((e) => TextMatchItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TextMatchesToJson(TextMatches instance) =>
    <String, dynamic>{'matches': instance.matches};

TextMatchItem _$TextMatchItemFromJson(Map<String, dynamic> json) =>
    TextMatchItem(
      type: json['type'] as String?,
      intensity: json['intensity'] as String?,
      match: json['match'] as String?,
      start: (json['start'] as num?)?.toInt(),
      end: (json['end'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TextMatchItemToJson(TextMatchItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'intensity': instance.intensity,
      'match': instance.match,
      'start': instance.start,
      'end': instance.end,
    };

TextScores _$TextScoresFromJson(Map<String, dynamic> json) => TextScores(
  toxicity: (json['toxicity'] as num).toDouble(),
  profanity: (json['profanity'] as num).toDouble(),
  hateSpeech: (json['hateSpeech'] as num).toDouble(),
  sexual: (json['sexual'] as num).toDouble(),
  threat: (json['threat'] as num).toDouble(),
);

Map<String, dynamic> _$TextScoresToJson(TextScores instance) =>
    <String, dynamic>{
      'toxicity': instance.toxicity,
      'profanity': instance.profanity,
      'hateSpeech': instance.hateSpeech,
      'sexual': instance.sexual,
      'threat': instance.threat,
    };
