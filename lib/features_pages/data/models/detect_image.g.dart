// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detect_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetectImage _$DetectImageFromJson(Map<String, dynamic> json) => DetectImage(
  status: json['status'] as String,
  request: DetectionRequest.fromJson(json['request'] as Map<String, dynamic>),
  type: DetectionType.fromJson(json['type'] as Map<String, dynamic>),
  media: DetectionMedia.fromJson(json['media'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DetectImageToJson(DetectImage instance) =>
    <String, dynamic>{
      'status': instance.status,
      'request': instance.request,
      'type': instance.type,
      'media': instance.media,
    };

DetectionRequest _$DetectionRequestFromJson(Map<String, dynamic> json) =>
    DetectionRequest(
      id: json['id'] as String,
      timestamp: (json['timestamp'] as num).toDouble(),
      operations: (json['operations'] as num).toInt(),
    );

Map<String, dynamic> _$DetectionRequestToJson(DetectionRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'operations': instance.operations,
    };

DetectionType _$DetectionTypeFromJson(Map<String, dynamic> json) =>
    DetectionType(aiGenerated: (json['ai_generated'] as num).toDouble());

Map<String, dynamic> _$DetectionTypeToJson(DetectionType instance) =>
    <String, dynamic>{'ai_generated': instance.aiGenerated};

DetectionMedia _$DetectionMediaFromJson(Map<String, dynamic> json) =>
    DetectionMedia(id: json['id'] as String, uri: json['uri'] as String);

Map<String, dynamic> _$DetectionMediaToJson(DetectionMedia instance) =>
    <String, dynamic>{'id': instance.id, 'uri': instance.uri};
