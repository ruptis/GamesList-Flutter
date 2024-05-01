class PlatformDto {
  final String id;
  final String name;
  final String abbreviation;

  PlatformDto(
      {required this.id, required this.name, required this.abbreviation});

  factory PlatformDto.fromJson(Map<String, dynamic> json, String id) {
    return PlatformDto(
        id: id, name: json['name'], abbreviation: json['abbreviation']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'abbreviation': abbreviation,
    };
  }
}
