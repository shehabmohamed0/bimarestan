import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';
@JsonSerializable()
class Price {
  final int id;
  final String name;
  final double price;
  final String description;
  final int clinicId;
  final String? clinicName;
  final String? clinicAddress;
  final String? clinicPhone;
  Price({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.clinicId,
    this.clinicName,
    this.clinicAddress,
    this.clinicPhone,
  });
  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
