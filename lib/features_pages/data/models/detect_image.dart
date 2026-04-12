import 'package:json_annotation/json_annotation.dart';

part 'detect_image.g.dart';

@JsonSerializable()
class DetectImage {
  final String status;
  final DetectionRequest request;
  final DetectionType type;
  final DetectionMedia media;

  DetectImage({
    required this.status,
    required this.request,
    required this.type,
    required this.media,
  });

  factory DetectImage.fromJson(Map<String, dynamic> json) =>
      _$DetectImageFromJson(json);

  Map<String, dynamic> toJson() => _$DetectImageToJson(this);
}

@JsonSerializable()
class DetectionRequest {
  final String id;
  final double timestamp;
  final int operations;

  DetectionRequest({
    required this.id,
    required this.timestamp,
    required this.operations,
  });

  factory DetectionRequest.fromJson(Map<String, dynamic> json) =>
      _$DetectionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DetectionRequestToJson(this);
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

@JsonSerializable()
class DetectionMedia {
  final String id;
  final String uri;

  DetectionMedia({
    required this.id,
    required this.uri,
  });

  factory DetectionMedia.fromJson(Map<String, dynamic> json) =>
      _$DetectionMediaFromJson(json);

  Map<String, dynamic> toJson() => _$DetectionMediaToJson(this);
}

/// flutter pub run build_runner build
