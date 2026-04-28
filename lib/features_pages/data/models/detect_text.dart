import 'package:json_annotation/json_annotation.dart';

part 'detect_text.g.dart';

@JsonSerializable()
class DetectText {
  final String status;
  final TextRequest request;
  final TextMatches profanity;
  final TextMatches personal;
  final TextMatches link;
  final TextScores? scores;

  DetectText({
    required this.status,
    required this.request,
    required this.profanity,
    required this.personal,
    required this.link,
    this.scores,
  });

  factory DetectText.fromJson(Map<String, dynamic> json) =>
      _$DetectTextFromJson(json);

  Map<String, dynamic> toJson() => _$DetectTextToJson(this);
}

@JsonSerializable()
class TextRequest {
  final String id;
  final double timestamp;
  final int operations;

  TextRequest({
    required this.id,
    required this.timestamp,
    required this.operations,
  });

  factory TextRequest.fromJson(Map<String, dynamic> json) =>
      _$TextRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TextRequestToJson(this);
}

@JsonSerializable()
class TextMatches {
  final List<TextMatchItem> matches;

  TextMatches({
    required this.matches,
  });

  factory TextMatches.fromJson(Map<String, dynamic> json) =>
      _$TextMatchesFromJson(json);

  Map<String, dynamic> toJson() => _$TextMatchesToJson(this);
}

@JsonSerializable()
class TextMatchItem {
  final String? type;
  final String? intensity;
  final String? match;
  final int? start;
  final int? end;

  TextMatchItem({
    this.type,
    this.intensity,
    this.match,
    this.start,
    this.end,
  });

  factory TextMatchItem.fromJson(Map<String, dynamic> json) =>
      _$TextMatchItemFromJson(json);

  Map<String, dynamic> toJson() => _$TextMatchItemToJson(this);
}

@JsonSerializable()
class TextScores {
  final double toxicity;
  final double profanity;
  final double hateSpeech;
  final double sexual;
  final double threat;

  TextScores({
    required this.toxicity,
    required this.profanity,
    required this.hateSpeech,
    required this.sexual,
    required this.threat,
  });

  factory TextScores.fromJson(Map<String, dynamic> json) =>
      _$TextScoresFromJson(json);

  Map<String, dynamic> toJson() => _$TextScoresToJson(this);

  factory TextScores.fromMatches(List<TextMatchItem> matches) {
    double toxicity = 0;
    double profanity = 0;
    double hateSpeech = 0;
    double sexual = 0;
    double threat = 0;

    double intensityToScore(String? intensity) {
      switch (intensity?.toLowerCase()) {
        case 'low':
          return 0.3;
        case 'medium':
          return 0.6;
        case 'high':
          return 0.9;
        default:
          return 0;
      }
    }

    for (var match in matches) {
      final score = intensityToScore(match.intensity);
      final type = match.type?.toLowerCase();

      if (type == 'insult' || type == 'inappropriate' || type == 'toxic') {
        if (score > toxicity) toxicity = score;
      }
      if (type == 'inappropriate' || type == 'profanity') {
        if (score > profanity) profanity = score;
      }
      if (type == 'discriminatory' || type == 'hate') {
        if (score > hateSpeech) hateSpeech = score;
      }
      if (type == 'sexual') {
        if (score > sexual) sexual = score;
      }
      if (type == 'threat' || type == 'violence') {
        if (score > threat) threat = score;
      }
    }

    return TextScores(
      toxicity: toxicity,
      profanity: profanity,
      hateSpeech: hateSpeech,
      sexual: sexual,
      threat: threat,
    );
  }
}

/// flutter pub run build_runner build
