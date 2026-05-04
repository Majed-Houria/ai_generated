import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()
class Register {
  final String id;
  final String email;

  Register({
    required this.id,
    required this.email,
  });
  factory Register.fromJson(Map<String, dynamic> json) =>
      _$RegisterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}
