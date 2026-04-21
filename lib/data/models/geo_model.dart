import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/geo_entity.dart';

part 'geo_model.g.dart';

@JsonSerializable()
class GeoModel extends GeoEntity {
  GeoModel({required super.lat, required super.lng});

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoModelToJson(this);
}
