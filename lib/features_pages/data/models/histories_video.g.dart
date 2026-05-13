// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'histories_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoriesVideo _$HistoriesVideoFromJson(Map<String, dynamic> json) =>
    HistoriesVideo(
      id: json['_id'] as String,
      status: json['status'] as String,
      request: json['request'] as String,
      media: VideoMedia.fromJson(json['media'] as Map<String, dynamic>),
      aiScore: (json['ai_score'] as num).toDouble(),
      data: VideoData.fromJson(json['data'] as Map<String, dynamic>),
      user: json['user'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$HistoriesVideoToJson(HistoriesVideo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'status': instance.status,
      'request': instance.request,
      'media': instance.media,
      'ai_score': instance.aiScore,
      'data': instance.data,
      'user': instance.user,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

VideoMedia _$VideoMediaFromJson(Map<String, dynamic> json) => VideoMedia(
  id: json['id'] as String,
  uri: json['uri'] as String,
  internalId: json['_id'] as String,
);

Map<String, dynamic> _$VideoMediaToJson(VideoMedia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uri': instance.uri,
      '_id': instance.internalId,
    };

VideoData _$VideoDataFromJson(Map<String, dynamic> json) => VideoData(
  status: json['status'] as String,
  started: (json['started'] as num).toDouble(),
  lastUpdate: (json['last_update'] as num).toDouble(),
  operations: (json['operations'] as num).toInt(),
  progress: (json['progress'] as num).toDouble(),
  frames: (json['frames'] as List<dynamic>)
      .map((e) => VideoFrame.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$VideoDataToJson(VideoData instance) => <String, dynamic>{
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
