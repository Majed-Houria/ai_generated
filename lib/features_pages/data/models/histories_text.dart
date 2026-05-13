import 'package:json_annotation/json_annotation.dart';

part 'histories_text.g.dart';

@JsonSerializable()
class HistoriesText {
  @JsonKey(name: '_id')
  final String id;
  final String text;
  final String status;
  final String request;
  final TextMatches profanity;
  final TextMatches personal;
  final TextMatches link;
  final RawData raw;
  final String user;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int v;

  HistoriesText({
    required this.id,
    required this.text,
    required this.status,
    required this.request,
    required this.profanity,
    required this.personal,
    required this.link,
    required this.raw,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory HistoriesText.fromJson(Map<String, dynamic> json) =>
      _$HistoriesTextFromJson(json);

  Map<String, dynamic> toJson() => _$HistoriesTextToJson(this);
}

@JsonSerializable()
class TextMatches {
  final List<dynamic> matches;

  TextMatches({required this.matches});

  factory TextMatches.fromJson(Map<String, dynamic> json) =>
      _$TextMatchesFromJson(json);

  Map<String, dynamic> toJson() => _$TextMatchesToJson(this);
}

@JsonSerializable()
class RawData {
  final String status;
  final RawRequest request;
  final TextMatches profanity;
  final TextMatches personal;
  final TextMatches link;

  RawData({
    required this.status,
    required this.request,
    required this.profanity,
    required this.personal,
    required this.link,
  });

  factory RawData.fromJson(Map<String, dynamic> json) =>
      _$RawDataFromJson(json);

  Map<String, dynamic> toJson() => _$RawDataToJson(this);
}

@JsonSerializable()
class RawRequest {
  final String id;
  final double timestamp;
  final int operations;

  RawRequest({
    required this.id,
    required this.timestamp,
    required this.operations,
  });

  factory RawRequest.fromJson(Map<String, dynamic> json) =>
      _$RawRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RawRequestToJson(this);
}
