import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  final String access_token;

  Login({
    required this.access_token,
  });
  factory Login.fromJson(Map<String, dynamic> json) =>
      _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
