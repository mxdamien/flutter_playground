import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/entities/company_entity.dart';
import '../../domain/entities/user_entity.dart';
import 'address_model.dart';
import 'company_model.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required AddressModel super.address,
    required super.phone,
    required super.website,
    required CompanyModel super.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  @JsonKey(fromJson: AddressModel.fromJson, toJson: _addressToJson)
  AddressEntity get address => super.address;

  static Map<String, dynamic> _addressToJson(AddressEntity address) {
    return (address as AddressModel).toJson();
  }

  @override
  @JsonKey(fromJson: CompanyModel.fromJson, toJson: _companyToJson)
  CompanyEntity get company => super.company;

  static Map<String, dynamic> _companyToJson(CompanyEntity company) {
    return (company as CompanyModel).toJson();
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
