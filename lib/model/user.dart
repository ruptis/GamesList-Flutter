enum Gender {
  female(value: "Female"),
  male(value: "Male"),
  other(value: "Other");

  const Gender({required this.value});

  final String value;
}

class User {
  final String id;
  final String name;
  final String email;
  final String? country;
  final Gender? gender;
  final DateTime? dateOfBirth;
  final DateTime dateOfRegistration;
  final String? bio;
  final String? links;
  final int gamesCount;
  final int passedGamesCount;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.country,
      required this.gender,
      required this.dateOfBirth,
      required this.dateOfRegistration,
      required this.bio,
      required this.links,
      required this.gamesCount,
      required this.passedGamesCount});

  factory User.newUser(String id, String name, String email) {
    return User(
        id: id,
        name: name,
        email: email,
        country: null,
        gender: null,
        dateOfBirth: null,
        dateOfRegistration: DateTime.now(),
        bio: null,
        links: null,
        gamesCount: 0,
        passedGamesCount: 0);
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? country,
    Gender? gender,
    DateTime? dateOfBirth,
    DateTime? dateOfRegistration,
    String? bio,
    String? links,
    int? gamesCount,
    int? passedGamesCount,
  }) =>
      User(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          country: country ?? this.country,
          gender: gender ?? this.gender,
          dateOfBirth: dateOfBirth ?? this.dateOfBirth,
          dateOfRegistration: dateOfRegistration ?? this.dateOfRegistration,
          bio: bio ?? this.bio,
          links: links ?? this.links,
          gamesCount: gamesCount ?? this.gamesCount,
          passedGamesCount: passedGamesCount ?? this.passedGamesCount);
}
