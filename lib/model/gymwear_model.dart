import 'package:json_annotation/json_annotation.dart';

part 'gymwear_model.g.dart';

@JsonSerializable()
class GymwearModel {
  final String name;
  final String shopLink;


  GymwearModel(this.name, this.shopLink);

  factory GymwearModel.fromJson(Map<String, dynamic> json) =>
      _$GymwearModelFromJson(json);

  Map<String, dynamic> toJson() => _$GymwearModelToJson(this);
}

@JsonSerializable()
class LogoModel {
  final String url;

  LogoModel(this.url);
}
