import 'package:json_annotation/json_annotation.dart';

part 'histories_image.g.dart';

@JsonSerializable()
class HistoriesImage {
  @JsonKey(name: '_id')
  final String id;
  final String status;
  final DetectionRequest request;
  final DetectionType type;
  final DetectionMedia media;
  final String user;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int v;

  HistoriesImage({
    required this.id,
    required this.status,
    required this.request,
    required this.type,
    required this.media,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory HistoriesImage.fromJson(Map<String, dynamic> json) =>
      _$HistoriesImageFromJson(json);

  Map<String, dynamic> toJson() => _$HistoriesImageToJson(this);
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
