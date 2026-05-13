import 'package:json_annotation/json_annotation.dart';

part 'histories_video.g.dart';

@JsonSerializable()
class HistoriesVideo {
  @JsonKey(name: '_id')
  final String id;
  final String status;
  final String request;
  final VideoMedia media;
  @JsonKey(name: 'ai_score')
  final double aiScore;
  final VideoData data;
  final String user;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int v;

  HistoriesVideo({
    required this.id,
    required this.status,
    required this.request,
    required this.media,
    required this.aiScore,
    required this.data,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory HistoriesVideo.fromJson(Map<String, dynamic> json) =>
      _$HistoriesVideoFromJson(json);

  Map<String, dynamic> toJson() => _$HistoriesVideoToJson(this);
}

@JsonSerializable()
class VideoMedia {
  final String id;
  final String uri;
  @JsonKey(name: '_id')
  final String internalId;

  VideoMedia({
    required this.id,
    required this.uri,
    required this.internalId,
  });

  factory VideoMedia.fromJson(Map<String, dynamic> json) =>
      _$VideoMediaFromJson(json);

  Map<String, dynamic> toJson() => _$VideoMediaToJson(this);
}

@JsonSerializable()
class VideoData {
  final String status;
  final double started;
  @JsonKey(name: 'last_update')
  final double lastUpdate;
  final int operations;
  final double progress;
  final List<VideoFrame> frames;

  VideoData({
    required this.status,
    required this.started,
    required this.lastUpdate,
    required this.operations,
    required this.progress,
    required this.frames,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) =>
      _$VideoDataFromJson(json);

  Map<String, dynamic> toJson() => _$VideoDataToJson(this);
}

@JsonSerializable()
class VideoFrame {
  final FrameInfo info;
  final DetectionType type;

  VideoFrame({
    required this.info,
    required this.type,
  });

  factory VideoFrame.fromJson(Map<String, dynamic> json) =>
      _$VideoFrameFromJson(json);

  Map<String, dynamic> toJson() => _$VideoFrameToJson(this);
}

@JsonSerializable()
class FrameInfo {
  final String id;
  final int position;

  FrameInfo({
    required this.id,
    required this.position,
  });

  factory FrameInfo.fromJson(Map<String, dynamic> json) =>
      _$FrameInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FrameInfoToJson(this);
}

@JsonSerializable()
class DetectionType {
  @JsonKey(name: 'ai_generated')
  final double aiGenerated;

  DetectionType({
    required this.aiGenerated,
  });

  factory DetectionType.fromJson(Map<String, dynamic> json) =>
      _$DetectionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$DetectionTypeToJson(this);
}