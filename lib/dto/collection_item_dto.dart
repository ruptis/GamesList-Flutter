import '../model/status.dart';

class CollectionItemDto {
  final String gameId;
  final Status status;

  CollectionItemDto({required this.gameId, required this.status});

  factory CollectionItemDto.fromJson(Map<String, dynamic> json, String gameId) {
    return CollectionItemDto(
        gameId: gameId,
        status: Status.values.firstWhere((e) => e.value == json['status']));
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.value,
    };
  }
}
