import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gameslist/dto/user_dto.dart';
import 'package:gameslist/model/user.dart';

extension UserMapper on User {
  UserDto toDto() => UserDto(
      id: id,
      name: name,
      email: email,
      country: country,
      gender: gender?.value,
      dateOfBirth:
          dateOfBirth == null ? null : Timestamp.fromDate(dateOfBirth!),
      dateOfRegistration: Timestamp.fromDate(dateOfRegistration),
      bio: bio,
      links: links);
}

extension UserDtoMapper on UserDto {
  User toModel(int gamesCount, int passedGamesCount) => User(
      id: id,
      name: name,
      email: email,
      country: country,
      gender: gender != null
          ? Gender.values.firstWhere((element) => element.value == gender)
          : null,
      dateOfBirth: dateOfBirth?.toDate(),
      dateOfRegistration: dateOfRegistration.toDate(),
      bio: bio,
      links: links,
      gamesCount: gamesCount,
      passedGamesCount: passedGamesCount);
}
