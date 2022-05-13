import 'package:json_annotation/json_annotation.dart';

part 'gymwear_model.g.dart';

@JsonSerializable()
class GymwearModel {
  final String name;
  final String shopLink;
  final LogoModel logo;


  GymwearModel(this.name, this.shopLink, this.logo);

  factory GymwearModel.fromJson(Map<String, dynamic> json) =>
      _$GymwearModelFromJson(json);

  Map<String, dynamic> toJson() => _$GymwearModelToJson(this);
}

@JsonSerializable()
class LogoModel {
  final String url;

  LogoModel(this.url);

  factory LogoModel.fromJson(Map<String, dynamic> json) =>
      _$LogoModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogoModelToJson(this);
}
