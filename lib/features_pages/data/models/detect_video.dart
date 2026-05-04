import 'package:json_annotation/json_annotation.dart';

part 'detect_video.g.dart';

@JsonSerializable()
class DetectVideo {
  final String status;
  final double started;
  @JsonKey(name: 'last_update')
  final double lastUpdate;
  final int operations;
  final double progress;
  final List<VideoFrame> frames;

  DetectVideo({
    required this.status,
    required this.started,
    required this.lastUpdate,
    required this.operations,
    required this.progress,
    required this.frames,
  });

  factory DetectVideo.fromJson(Map<String, dynamic> json) =>
      _$DetectVideoFromJson(json);

  Map<String, dynamic> toJson() => _$DetectVideoToJson(this);
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

/// flutter pub run build_runner build
