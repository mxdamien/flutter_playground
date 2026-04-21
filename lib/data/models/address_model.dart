import 'package:flutter_playground/domain/entities/geo_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/address_entity.dart';
import 'geo_model.dart';

part 'address_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressModel extends AddressEntity {
  AddressModel({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required GeoModel super.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  @override
  @JsonKey(fromJson: GeoModel.fromJson, toJson: _geoToJson)
  GeoEntity get geo => super.geo;

  static Map<String, dynamic> _geoToJson(GeoEntity geo) {
    return (geo as GeoModel).toJson();
  }

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
