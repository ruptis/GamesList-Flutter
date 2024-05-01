import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gameslist/dto/game_dto.dart';
import 'package:gameslist/repository/game_repository.dart';

class FirestoreGameRepository implements GameRepository {
  final CollectionReference _gamesCollection =
      FirebaseFirestore.instance.collection('games');

  @override
  Stream<List<GameDto>> getGames() =>
      _gamesCollection.snapshots().map((snapshot) => snapshot.docs
          .map((doc) =>
              GameDto.fromJson(doc.data() as Map<String, dynamic>, doc.id))
          .toList());

  @override
  Stream<GameDto> getGame(String gameId) =>
      _gamesCollection.doc(gameId).snapshots().map((doc) =>
          GameDto.fromJson(doc.data() as Map<String, dynamic>, doc.id));
}
