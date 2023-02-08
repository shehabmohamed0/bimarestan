import 'package:json_annotation/json_annotation.dart';

part 'speciality.g.dart';

@JsonSerializable()
class Speciality {
  int id;
  String name;
  String? description;
  String image;

  Speciality({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });
  @override
  String toString() => 'Speciality:$id, $name, $description, $image';

  factory Speciality.fromJson(Map<String, dynamic> json) =>
      _$SpecialityFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialityToJson(this);
}
