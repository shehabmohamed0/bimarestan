import 'package:json_annotation/json_annotation.dart';
part 'payment.g.dart';

@JsonSerializable()
class PaymentMethod {
  final int id;
  final String name;

  PaymentMethod({
    required this.id,
    required this.name,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
