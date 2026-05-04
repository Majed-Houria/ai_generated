// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detect_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetectVideo _$DetectVideoFromJson(Map<String, dynamic> json) => DetectVideo(
  status: json['status'] as String,
  started: (json['started'] as num).toDouble(),
  lastUpdate: (json['last_update'] as num).toDouble(),
  operations: (json['operations'] as num).toInt(),
  progress: (json['progress'] as num).toDouble(),
  frames: (json['frames'] as List<dynamic>)
      .map((e) => VideoFrame.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DetectVideoToJson(DetectVideo instance) =>
    <String, dynamic>{
      'status': instance.status,
      'started': instance.started,
      'last_update': instance.lastUpdate,
      'operations': instance.operations,
      'progress': instance.progress,
      'frames': instance.frames,
    };

VideoFrame _$VideoFrameFromJson(Map<String, dynamic> json) => VideoFrame(
  info: FrameInfo.fromJson(json['info'] as Map<String, dynamic>),
  type: DetectionType.fromJson(json['type'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VideoFrameToJson(VideoFrame instance) =>
    <String, dynamic>{'info': instance.info, 'type': instance.type};

FrameInfo _$FrameInfoFromJson(Map<String, dynamic> json) => FrameInfo(
  id: json['id'] as String,
  position: (json['position'] as num).toInt(),
);

Map<String, dynamic> _$FrameInfoToJson(FrameInfo instance) => <String, dynamic>{
  'id': instance.id,
  'position': instance.position,
};

DetectionType _$DetectionTypeFromJson(Map<String, dynamic> json) =>
    DetectionType(aiGenerated: (json['ai_generated'] as num).toDouble());

Map<String, dynamic> _$DetectionTypeToJson(DetectionType instance) =>
    <String, dynamic>{'ai_generated': instance.aiGenerated};
