import 'package:json_annotation/json_annotation.dart';
import "user.dart";
import "cacheConfig.dart";

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  Profile();

  late User? user;
  late String token;
  late num theme;
  late CacheConfig? cache;
  late String? lastLogin;
  late String? locale;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
