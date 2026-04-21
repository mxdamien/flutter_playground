import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/company_entity.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel extends CompanyEntity {
  CompanyModel({
    required super.name,
    required super.catchPhrase,
    required super.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
