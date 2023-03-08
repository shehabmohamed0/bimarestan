import 'package:json_annotation/json_annotation.dart';

import '../../core/enums.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final String? image;
  final String address;
  final String description;
  final String? jobTitle;
  final int age;
  final RoleId roleId;
  final String? roleName;
  @JsonKey(defaultValue: 'token')
  final String token;
  final String? catergoryId;
  final String? catergoryName;
  final int? clinicId;
  final String? clinicName;
  Profile({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    this.image,
    required this.address,
    required this.description,
    this.jobTitle,
    required this.age,
    required this.roleId,
    required this.roleName,
    required this.token,
    this.catergoryId,
    this.catergoryName,
    this.clinicId,
    this.clinicName,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

final profiles = List.generate(
    60,
    (index) => Profile(
          address: 'address $index',
          age: index,
          description: 'description $index',
          email: 'email $index',
          fullName: 'fullName $index',
          id: index,
          image: 'image $index',
          phone: 'phone $index',
          roleId: RoleId.patient,
          roleName: 'roleName $index',
          token: 'token $index',
        )).toList();
