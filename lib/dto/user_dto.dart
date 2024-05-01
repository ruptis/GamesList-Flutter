import 'package:cloud_firestore/cloud_firestore.dart';

class UserDto {
  final String id;
  final String name;
  final String email;
  final String? country;
  final String? gender;
  final Timestamp? dateOfBirth;
  final Timestamp dateOfRegistration;
  final String? bio;
  final String? links;

  UserDto(
      {required this.id,
      required this.name,
      required this.email,
      required this.country,
      required this.gender,
      required this.dateOfBirth,
      required this.dateOfRegistration,
      required this.bio,
      required this.links});

  factory UserDto.fromJson(Map<String, dynamic> json, String id) {
    return UserDto(
        id: id,
        name: json['name'],
        email: json['email'],
        country: json['country'],
        gender: json['gender'],
        dateOfBirth: json['dateOfBirth'] as Timestamp?,
        dateOfRegistration: json['dateOfRegistration'] as Timestamp,
        bio: json['bio'],
        links: json['links']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'country': country,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'dateOfRegistration': dateOfRegistration,
      'bio': bio,
      'links': links
    };
  }
}
